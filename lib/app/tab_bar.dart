// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wechat/app/app_model.dart';
import 'package:wechat/util/color_util.dart';
import 'package:wechat/util/utils.dart';

class YZTabBarWidget extends StatefulWidget {
  const YZTabBarWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _YZTabBarWidgetState createState() => _YZTabBarWidgetState();
}

class _YZTabBarWidgetState extends State<YZTabBarWidget> {
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
    return Consumer<YZAppTabBarViewModel>(builder: (context, model, child) {
      // print('tabBar index = ${model.selectedIndex}');
      return _bottomNavigationBar(model);
    });
  }

  BottomNavigationBar _bottomNavigationBar(YZAppTabBarViewModel model) {
    return BottomNavigationBar(
      // bar items
      items: [
        _bottomNavigationBarItem(
            '微信', AssetImage(YZUtils.assetsImagePath('tab/tab_home'))),
        _bottomNavigationBarItem(
            '通讯录', AssetImage(YZUtils.assetsImagePath('tab/tab_contact'))),
        _bottomNavigationBarItem(
            '发现', AssetImage(YZUtils.assetsImagePath('tab/tab_find'))),
        _bottomNavigationBarItem(
            '我的', AssetImage(YZUtils.assetsImagePath('tab/tab_mine'))),
      ],
      // 选中 index
      currentIndex: model.selectedIndex,
      // 点击事件
      onTap: (index) {
        model.selectedIndex = index;
      },
      // 固定大小，取消自适应偏移
      type: BottomNavigationBarType.fixed,

      // item未选中时的颜色
      unselectedItemColor: YZColors.tab_bar_normal_color,
      // item选中时的颜色
      selectedItemColor: YZColors.tab_bar_selected_color,
      // 未选中时标题字体大小
      unselectedFontSize: 13.0,
      // 选中时标题字体大小
      selectedFontSize: 13.0,
      // 未选中时显示 title
      showUnselectedLabels: true,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String title, AssetImage image) {
    // icon的尺寸大小
    double iconSize = 30.0;
    return BottomNavigationBarItem(
      label: title,
      icon: SizedBox(
        width: iconSize,
        height: iconSize,
        child: Image(
          image: image,
          color: YZColors.tab_bar_normal_color,
        ),
      ),
      activeIcon: SizedBox(
        width: iconSize,
        height: iconSize,
        child: Image(
          image: image,
          color: YZColors.tab_bar_selected_color,
        ),
      ),
    );
  }
}
