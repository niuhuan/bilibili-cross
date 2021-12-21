import 'dart:convert';

import 'package:bilibili/basic/entities.dart';
import 'package:bilibili/ffi/video_quality.dart';

import 'ffi.dart';

const ffi = FFI._();

class FFI {
  const FFI._();

  Future<BvInfo> bvInfo(String bvId) async {
    return BvInfo.fromJson(jsonDecode(await rustFlatInvoke("bv_info", bvId)));
  }

  Future<BVDownloadUrl> bvDownloadUrl(
      String bvId, int cid, VideoQuality videoQuality) async {
    return BVDownloadUrl.fromJson(
        jsonDecode(await rustFlatInvoke("bv_download_url", {
      "bvid": bvId,
      "cid": cid,
      "video_quality": videoQuality.number,
    })));
  }
}
