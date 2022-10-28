// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

class YZLoginWidget extends StatefulWidget {
  const YZLoginWidget({Key? key}) : super(key: key);

  @override
  _YZLoginWidgetState createState() => _YZLoginWidgetState();
}

class _YZLoginWidgetState extends State<YZLoginWidget> {
  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('登录'),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
