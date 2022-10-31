// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:wechat/mine/widget/mine_top.dart';
import 'package:wechat/mine/widget/mine_content.dart';
import 'package:wechat/util/color_util.dart';

class YZMineBodyWidget extends StatelessWidget {
  final double topMarin;

  const YZMineBodyWidget({
    Key? key,
    required this.topMarin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: YZColors.main_page_background_color,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: topMarin,
            child: const YZMineTopWidget(),
          ),
          Positioned(
            top: topMarin,
            left: 0.0,
            right: 0.0,
            bottom: -topMarin,
            child: YZMineContentWidget(),
          ),
        ],
      ),
    );
  }
}
