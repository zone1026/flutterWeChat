// ignore_for_file: unnecessary_getters_setters, unnecessary_new, empty_constructor_bodies,, avoid_print
// ignore_for_file: prefer_conditional_assignment, unnecessary_null_comparison
// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import 'package:wechat/home/pages/home_page.dart';
import 'package:wechat/contact/pages/contact_page.dart';
import 'package:wechat/find/pages/find_page.dart';
import 'package:wechat/mine/pages/mine_page.dart';

class YZAppManager {
  // 单例模式
  static YZAppManager? _instance;
  // get单例对象
  static YZAppManager get instance => _getInstance();
  // 工厂模式
  factory YZAppManager() => _getInstance();

  static YZAppManager _getInstance() {
    if (_instance == null) {
      _instance = new YZAppManager._init();
    }

    return _instance!;
  }

  YZAppManager._init() {
    print('appManager init');
  }

  // TarBar下标
  var _selectedIndex = 0;

  // TarBar下标 set & get
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
  }

  // AppPageModel
  final YZAppPagesViewModel _pageModel = YZAppPagesViewModel();
  YZAppPagesViewModel get pageModel => _pageModel;

  // AppTabBarModel
  final YZAppTabBarViewModel _tabBarModel = YZAppTabBarViewModel(
    (index) {
      YZAppManager.instance.selectedIndex = index;
      YZAppManager.instance.pageModel.selectedPage = index;
      YZAppManager.instance.notifyAll();
    },
  );
  YZAppTabBarViewModel get tabBarModel => _tabBarModel;

  void notifyAll() {
    pageModel.notifyListeners();
    tabBarModel.notifyListeners();
  }
}

class YZAppPagesViewModel with ChangeNotifier {
  // 下标
  int _selectedPage = 0;

  final List<Widget> _pages = [];
  YZAppPagesViewModel() {
    _initialPages();
  }

  int get selectedPage => _selectedPage;

  set selectedPage(int index) {
    _selectedPage = index;
  }

  List<Widget> _initialPages() {
    _pages.add(const YZHomePageWidget());
    _pages.add(const YZContactPageWidget());
    _pages.add(const YZFindPageWidget());
    _pages.add(const YZMinePageWidget());

    return _pages;
  }

  List<Widget> get pages => _pages;

  // 当前显示的widget
  Widget currentPageWidget() {
    if (_pages.length > _selectedPage) {
      return _pages[_selectedPage];
    }

    // 页面索引出现错误
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text(
          'page config error',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}

class YZAppTabBarViewModel with ChangeNotifier {
  // ignore: unused_field
  final ValueChanged<int> _valueChanged;

  YZAppTabBarViewModel(this._valueChanged);

  // 下标
  int _selectedIndex = 0;

  // 下标 get & set
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int index) {
    _selectedIndex = index;
    _valueChanged(index);
  }
}
