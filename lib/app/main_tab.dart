// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wechat/app/app_model.dart';
import 'package:wechat/app/tab_bar.dart';
import 'package:wechat/app/main_page.dart';

/// 1、Flutter 不会重建构建 `const` 组件
///
/// 2、尽可能地将组件的属性声明为 `final` ，构造方法声明为`const`，并且使用 `const` 使用该组件对象。
class YZMainTabWidget extends StatefulWidget {
  const YZMainTabWidget({Key? key}) : super(key: key);

  @override
  _YZMainTabWidgetState createState() => _YZMainTabWidgetState();
}

class _YZMainTabWidgetState extends State<YZMainTabWidget> {
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
      bottomNavigationBar: ChangeNotifierProvider(
        create: (context) => YZAppManager.instance.tabBarModel,
        child: const YZTabBarWidget(),
      ),
      body: ChangeNotifierProvider(
        create: (context) => YZAppManager.instance.pageModel,
        child: const YZMainPageWidget(),
      ),
    );
  }
}
