import 'package:flutter/material.dart';

final GlobalKey<State> _keyLoader = GlobalKey<State>();

class Dialogs {

  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: _keyLoader,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "请稍后",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }

  static void disposeLoadingDialog(){
    Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();
  }

}
