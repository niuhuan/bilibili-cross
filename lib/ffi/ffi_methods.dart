import 'dart:convert';

import 'package:bilibili/basic/entities.dart';

import 'ffi.dart';

const ffi = FFI._();

class FFI {

  const FFI._();

  Future<BvInfo> bvInfo(String bvid) async {
    return BvInfo.fromJson(jsonDecode(await rustFlatInvoke("bv_info", bvid)));
  }

}

