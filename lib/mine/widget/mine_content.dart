// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wechat/mine/model/mine_model.dart';
import 'package:wechat/mine/widget/mine_item_widget.dart';

class YZMineContentWidget extends StatelessWidget {
  YZMineContentWidget({Key? key}) : super(key: key);

  // ignore: unused_field
  final List<YZMineItemModel> _items = [];

  @override
  Widget build(BuildContext context) {
    _initData();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _itemWidgetList(),
    );
  }

  /// 初始化数据
  void _initData() {
    _items.add(YZMineItemModel(YZMineItemType.pay));
    _items.add(YZMineItemModel(YZMineItemType.padding));

    _items.add(YZMineItemModel(YZMineItemType.collection));
    _items.add(YZMineItemModel(YZMineItemType.album));
    _items.add(YZMineItemModel(YZMineItemType.wallet));
    _items.add(YZMineItemModel(YZMineItemType.face));
    _items.add(YZMineItemModel(YZMineItemType.padding));

    _items.add(YZMineItemModel(YZMineItemType.setting));
  }

  List<Widget> _itemWidgetList() {
    List<Widget> widgetList = [];
    for (var model in _items) {
      if (model.type == YZMineItemType.padding) {
        widgetList.add(const Padding(padding: EdgeInsets.only(top: 10.0)));
      } else {
        widgetList.add(
          YZMineItemWidget(
            model: model,
            onItemTap: (model) {
              print('click item title : ${model.title}');
            },
          ),
        );
      }
    }
    return widgetList;
  }
}
