import 'package:bilibili/screens/app_screen.dart';
import 'package:flutter/material.dart';

import 'ffi/ffi.dart';

void main() async {
  await initFFI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppScreen(),
    );
  }
}
