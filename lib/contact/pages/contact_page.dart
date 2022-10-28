// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:wechat/util/app_bar_util.dart';

class YZContactPageWidget extends StatefulWidget {
  const YZContactPageWidget({Key? key}) : super(key: key);
  @override
  _YZContactPageWidgetState createState() => _YZContactPageWidgetState();
}

class _YZContactPageWidgetState extends State<YZContactPageWidget> {
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
      appBar: YZAppBar.mainPageNavigationAppBar('通讯录'),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
