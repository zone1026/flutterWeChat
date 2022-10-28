import 'package:flutter/material.dart';

import 'package:wechat/util/color_util.dart';

class YZAppBar {
  /// app 导航栏
  ///
  /// title: 导航栏标题
  ///
  /// context: 页面上下文，用于返回时传参，不为空时显示返回按钮
  static AppBar mainPageNavigationAppBar(String title) {
    return AppBar(
      backgroundColor: YZColors.navigation_bar_background_color,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: YZColors.navigation_bar_title_color,
          fontSize: 18.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0.0,
    );
  }

  /// app 统一导航栏
  ///
  /// title: 导航栏标题
  ///
  /// context: 页面上下文，用于返回时传参，不为空时显示返回按钮
  static AppBar commonNavigationAppBar(String title, {BuildContext? context}) {
    return AppBar(
      backgroundColor: YZColors.navigation_bar_background_color,
      leading: context == null
          ? null
          : IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: YZColors.navigation_bar_title_color,
          fontSize: 18.0,
          // fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 5.0,
      shadowColor: Colors.black,
    );
  }
}
