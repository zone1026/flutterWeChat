// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wechat/find/model/find_model.dart';
import 'package:wechat/util/color_util.dart';

class YZFindItemWidget extends StatelessWidget {
  final YZFindItemModel model;
  final void Function(YZFindItemModel model) onItemTap;

  const YZFindItemWidget({
    Key? key,
    required this.model,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          onItemTap(model);
        },
        child: SizedBox(
          height: 60.0,
          child: _stack(),
        ),
      ),
    );
  }

  Stack _stack() {
    List<Widget> children = [];
    children.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        bottom: 0.0,
        right: 0.0,
        child: _itemWidget(),
      ),
    );

    // 是否有分割线
    if (model.hasDivide == true) {
      children.add(
        const Positioned(
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          child: Divider(
            color: YZColors.item_widget_divider_color,
            height: 1.0,
            thickness: 1.0,
          ),
        ),
      );
    }
    return Stack(
      children: children,
    );
  }

  Container _itemWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 18.0),
      child: _contentWidget(),
    );
  }

  Row _contentWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // icon
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: Image(image: AssetImage(model.icon)),
            ),
            // icon和标题间的间距
            const Padding(padding: EdgeInsets.only(right: 15.0)),
            // 标题
            Text(
              model.title,
              style: const TextStyle(
                fontSize: 15.0,
                color: YZColors.text_title_color,
              ),
            ),
          ],
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(
          width: 12.0,
          height: 30.0,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18.0,
            color: YZColors.arrow_forward_color,
          ),
        )
      ],
    );
  }
}
