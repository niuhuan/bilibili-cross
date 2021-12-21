mod types;

use bilirust::types::*;
use bilirust::*;
use libc::c_char;
use serde::Serialize;
use std::ffi::CString;
use std::sync::Mutex;
use types::*;

lazy_static::lazy_static! {
    static ref CLIENT: Mutex<bilirust::Client> = Mutex::new(bilirust::Client::new());
}

/// 提供给dart调用底层方法的映射
/// 返回的 *mut c_char 必须再还给rust析构, 否则会造成内存泄露
#[no_mangle]
pub unsafe extern "C" fn rust_flat_invoke(method: *mut c_char, params: *mut c_char) -> *mut c_char {
    let rt = tokio::runtime::Builder::new_current_thread()
        .enable_all()
        .build()
        .unwrap();
    // 校验method并解析成str
    let method = CString::from_raw(method);
    let method = match method.to_str() {
        Ok(str) => str,
        Err(_) => {
            panic!("What's up");
        }
    };
    // 校验method并解析成str
    let params = CString::from_raw(params);
    let params = match params.to_str() {
        Ok(str) => str,
        Err(_) => {
            panic!("What's up");
        }
    };
    let params = String::from(params);
    let result: Result<String> = rt.block_on(match_method(method, params));
    rt.shutdown_background();
    let result: ResponseToDart = match result {
        Ok(str) => ResponseToDart {
            response_data: str,
            error_message: "".to_string(),
        },
        Err(err) => ResponseToDart {
            response_data: "".to_string(),
            error_message: err.to_string(),
        },
    };
    let result = serde_json::to_string(&result).unwrap();
    CString::new(result).unwrap().into_raw()
}

#[no_mangle]
pub unsafe extern "C" fn rust_free_str(c: *mut c_char) {
    CString::from_raw(c);
}

async fn match_method(method: &str, params: String) -> Result<String> {
    match method {
        "set_sess_data" => {
            set_sess_data(params).await;
            Ok(String::default())
        }
        "my_info" => string_result(client().my_info().await?),
        "bv_info" => string_result(client().bv_info(params).await?),
        "bv_download_url" => bv_download_url(params).await,
        _ => Err(Box::new(Error::from("NO FLAT"))),
    }
}

fn client() -> Client {
    let lock = CLIENT.lock().unwrap();
    let client: Client = lock.clone();
    drop(lock);
    client
}

fn string_result<T: Serialize>(t: T) -> Result<String> {
    Ok(serde_json::to_string(&t)?)
}

async fn set_sess_data(sess_data: String) {
    let mut lock = CLIENT.lock().unwrap();
    lock.login_set_sess_data(sess_data);
    drop(lock);
}

async fn bv_download_url(params: String) -> Result<String> {
    let download_url: BvDownloadUrlQuery = serde_json::from_str(params.as_str())?;
    string_result(
        client()
            .bv_download_url(
                download_url.bvid,
                download_url.cid,
                download_url.video_quality,
            )
            .await?,
    )
}
