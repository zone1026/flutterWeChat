// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:wechat/util/app_bar_util.dart';

class YZHomePageWidget extends StatefulWidget {
  const YZHomePageWidget({Key? key}) : super(key: key);
  @override
  _YZHomePageWidgetState createState() => _YZHomePageWidgetState();
}

class _YZHomePageWidgetState extends State<YZHomePageWidget> {
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
      appBar: YZAppBar.mainPageNavigationAppBar('微信'),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
