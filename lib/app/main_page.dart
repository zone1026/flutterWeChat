// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wechat/app/app_model.dart';

class YZMainPageWidget extends StatefulWidget {
  const YZMainPageWidget({Key? key}) : super(key: key);
  @override
  _YZMainPageWidgetState createState() => _YZMainPageWidgetState();
}

class _YZMainPageWidgetState extends State<YZMainPageWidget> {
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
    return Consumer<YZAppPagesViewModel>(
      builder: (context, model, child) {
        return model.currentPageWidget();
      },
    );
  }
}
