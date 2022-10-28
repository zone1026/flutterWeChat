import 'package:flutter/material.dart';
import 'package:wechat/app/main_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WeChat',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: const Color.fromRGBO(233, 234, 235, 1.0),
      ),
      home: const YZMainTabWidget(),
    );
  }
}
