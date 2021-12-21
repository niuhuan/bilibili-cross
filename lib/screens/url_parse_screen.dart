import 'dart:convert';

import 'package:bilibili/basic/entities.dart';
import 'package:bilibili/ffi/ffi_methods.dart';
import 'package:bilibili/ffi/video_quality.dart';
import 'package:bilibili/screens/components/dialogs.dart';
import 'package:flutter/material.dart';

class UrlParseScreen extends StatefulWidget {
  const UrlParseScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UrlParseScreenState();
}

class _UrlParseScreenState extends State<UrlParseScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.white.withAlpha(200),
                borderRadius: const BorderRadius.all(Radius.circular(3))),
            child: TextFormField(
              controller: _textController,
              onEditingComplete: _onConfirm,
              decoration: InputDecoration(
                labelText: 'BILIBILI URL',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _onConfirm,
                  icon: const Icon(
                    Icons.download,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _onConfirm() async {
    var text = _textController.text;
    String? bvId = _bvIdRegex.stringMatch(text);
    if (bvId != null) {
      BvInfo? bvInfo;
      BVDownloadUrl? bvDownloadUrl;
      Dialogs.showLoadingDialog(context);
      try {
        bvInfo = await ffi.bvInfo(bvId);
        bvDownloadUrl = await ffi.bvDownloadUrl(
          bvId,
          bvInfo.cid,
          VideoQuality.videoQuality720P,
        );
      } catch (e, s) {
        print("$e\n$s");
      } finally {
        Dialogs.disposeLoadingDialog();
      }
    }
  }

  final _bvIdRegex = RegExp("BV[0-9a-zA-Z]{10}");
}
