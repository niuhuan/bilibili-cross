use bilirust::VideoQuality;
use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize)]
pub struct ResponseToDart {
    pub error_message: String,
    pub response_data: String,
}

#[derive(Debug, Deserialize, Serialize)]
pub struct BvDownloadUrlQuery {
    pub bvid: String,
    pub cid: i32,
    pub video_quality: VideoQuality,
}
