use serde::{Deserialize, Serialize};

#[derive(Debug, Deserialize, Serialize)]
pub struct ResponseToDart {
    pub error_message: String,
    pub response_data: String,
}
