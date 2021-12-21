// 负载平衡器
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:isolate/isolate.dart';

// 负载平衡器
late LoadBalancer _loadBalancer;

// 初始化
Future initFFI() async {
  _loadBalancer = await LoadBalancer.create(15, IsolateRunner.spawn);
}

Future<String> rustFlatInvoke(String method, dynamic params) {
  return _loadBalancer.run(_rustFlatInvokeCompute, {
    "method": method,
    "params": params is String ? params : jsonEncode(params),
  });
}

Future<String> _rustFlatInvokeCompute(Map<String, String> map) async {
  _initLibrary();
  // 调用, 释放rust字符串, 并返回结果
  var point = _rustFlatInvoke!(
    map["method"]!.toNativeUtf8(),
    map["params"]!.toNativeUtf8(),
  );
  var ds = point.toDartString();
  _rustFreeStr!(point);
  // 转换并返回
  var rsp = _ResponseToDart.fromJson(jsonDecode(ds));
  if (rsp.errorMessage != "") {
    throw Exception(rsp.errorMessage);
  }
  return rsp.responseData;
}

// 加载DLL

void _initLibrary() {
  // 第一次使用时需要初始化
  _rustFlatInvoke ??= _loadDynamicLibrary()
      .lookup<
          NativeFunction<
              Pointer<Utf8> Function(
                  Pointer<Utf8>, Pointer<Utf8>)>>('rust_flat_invoke')
      .asFunction();
  _rustFreeStr ??= _loadDynamicLibrary()
      .lookup<NativeFunction<Void Function(Pointer<Utf8>)>>("rust_free_str")
      .asFunction();
}

DynamicLibrary _loadDynamicLibrary() {
  if (Platform.isMacOS) {
    return DynamicLibrary.open('libbilibili.dylib');
  } else if (Platform.isAndroid) {
    return DynamicLibrary.open('mylib.so');
  } else if (Platform.isIOS) {
    return DynamicLibrary.process();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('mylib.dll');
  }
  throw '不支持的操作系统';
}

Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>)? _rustFlatInvoke;
void Function(Pointer<Utf8>)? _rustFreeStr;

class _ResponseToDart {
  late String errorMessage;
  late String responseData;

  _ResponseToDart.fromJson(Map<String, dynamic> json) {
    errorMessage = json["error_message"];
    responseData = json["response_data"];
  }
}
