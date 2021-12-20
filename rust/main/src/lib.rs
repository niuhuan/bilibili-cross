mod types;

use bilirust::types::*;
use bilirust::*;
use libc::c_char;
use serde::Serialize;
use std::ffi::CString;
use std::sync::Mutex;
use types::*;

/// 提供给dart调用底层方法的映射
/// 返回的 *mut c_char 必须再还给rust析构, 否则会造成内存泄露
#[no_mangle]
pub async unsafe extern "C" fn rust_flat_invoke(
    method: *mut c_char,
    params: *mut c_char,
) -> *mut c_char {
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
    let result: Result<String> = match_method(method, params).await;
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

async fn match_method(method: &str, params: String) -> Result<String> {
    match method {
        "my_info" => string_result(client().my_info().await?),
        "set_sess_data" => {
            set_sess_data(params).await;
            Ok(String::default())
        }
        _ => Err(Box::new(Error::from("NO FLAT"))),
    }
}

lazy_static::lazy_static! {
    static ref CLIENT: Mutex<bilirust::Client> = Mutex::new(bilirust::Client::new());
}

fn string_result<T: Serialize>(t: T) -> Result<String> {
    Ok(serde_json::to_string(&t)?)
}

fn client() -> Client {
    let lock = CLIENT.lock().unwrap();
    let client: Client = lock.clone();
    drop(lock);
    client
}

async fn set_sess_data(sess_data: String) {
    let mut lock = CLIENT.lock().unwrap();
    lock.login_set_sess_data(sess_data);
    drop(lock);
}
