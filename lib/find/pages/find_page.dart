// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:wechat/find/model/find_model.dart';
import 'package:wechat/find/widget/find_item_widget.dart';
import 'package:wechat/util/app_bar_util.dart';
import 'package:wechat/util/color_util.dart';

class YZFindPageWidget extends StatefulWidget {
  const YZFindPageWidget({Key? key}) : super(key: key);
  @override
  _YZFindPageWidgetState createState() => _YZFindPageWidgetState();
}

class _YZFindPageWidgetState extends State<YZFindPageWidget> {
  final List<YZFindItemModel> _items = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _items.clear();

    _initSectionData();
  }

  void _initSectionData() {
    _items.add(YZFindItemModel(YZFindItemType.friend));
    _items.add(YZFindItemModel(YZFindItemType.padding));

    _items.add(YZFindItemModel(YZFindItemType.scan));
    _items.add(YZFindItemModel(YZFindItemType.padding));

    _items.add(YZFindItemModel(YZFindItemType.look));
    _items.add(YZFindItemModel(YZFindItemType.search));
    _items.add(YZFindItemModel(YZFindItemType.padding));

    _items.add(YZFindItemModel(YZFindItemType.game));
    _items.add(YZFindItemModel(YZFindItemType.padding));

    _items.add(YZFindItemModel(YZFindItemType.smallProject));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YZColors.main_page_background_color,
      appBar: YZAppBar.mainPageNavigationAppBar('发现'),
      body: ListView(
        children: _itemWidgetList(),
      ),
    );
  }

  // item widget 列表
  List<Widget> _itemWidgetList() {
    List<Widget> widgetList = [];
    for (var model in _items) {
      YZFindItemType type = model.type;
      if (type == YZFindItemType.padding) {
        widgetList.add(const Padding(padding: EdgeInsets.only(top: 10.0)));
      } else {
        widgetList.add(
          YZFindItemWidget(
            model: model,
            onItemTap: (model) {
              print('click item title: ${model.title}');
            },
          ),
        );
      }
    }

    return widgetList;
  }
}
