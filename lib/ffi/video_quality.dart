class VideoQuality {
  int number;

  VideoQuality._(this.number);

// 240P 极速 仅mp4方式支持
  static VideoQuality videoQuality240P = VideoQuality._(6);

// 360P 流畅
  static VideoQuality videoQuality360P = VideoQuality._(16);

// 480P 清晰
  static VideoQuality videoQuality480P = VideoQuality._(32);

// 720P 高清 ;
// web端默认值 , B站前端需要登录才能选择，但是直接发送请求可以不登录就拿到720P的取流地址
// 无720P时则为720P60
  static VideoQuality videoQuality720P = VideoQuality._(64);

// 720P60 高帧率 ; 需要认证登录账号
  static VideoQuality videoQuality720P60Hz = VideoQuality._(74);

// 1080P 高清
// TV端与APP端默认值, 需要认证登录账号
  static VideoQuality videoQuality1080P = VideoQuality._(80);

// 1080P+ 高码率	大多情况需求认证大会员账号
  static VideoQuality videoQuality1080PHigh = VideoQuality._(112);

// 1080P60 高帧率	大多情况需求认证大会员账号
  static VideoQuality videoQuality1080P60Hz = VideoQuality._(116);

// 4K 超清	需要fnver&128=128且fourk=1  大多情况需求认证大会员账号
  static VideoQuality videoQuality4K = VideoQuality._(120);

// HDR 真彩色	仅支持dash方式
// 需要fnver&64=64
// 大多情况需求认证大会员账号
  static VideoQuality videoQualityHDR = VideoQuality._(125);
}
