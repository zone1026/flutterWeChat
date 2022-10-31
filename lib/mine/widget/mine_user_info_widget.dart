// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:wechat/util/color_util.dart';
import 'package:wechat/util/utils.dart';

class YZMineUserInfoWidget extends StatelessWidget {
  final String nickName;
  final String portraitUrl;
  final void Function() onUserInfoTap;

  const YZMineUserInfoWidget({
    Key? key,
    required this.nickName,
    required this.portraitUrl,
    required this.onUserInfoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 顶部安全距离
    double topMarin = MediaQuery.of(context).padding.top;

    return GestureDetector(
      onTap: () {
        onUserInfoTap();
      },
      child: SizedBox(
        height: topMarin + 130.0,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Positioned(
              top: topMarin + 30.0,
              left: 20.0,
              child: _userInfoWidget(nickName, portraitUrl),
            ),
            Positioned(
              top: topMarin + 60.0,
              right: 15.0,
              child: _scanWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Row _userInfoWidget(String name, String userPortraitUrl) {
    return Row(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: YZColors.main_page_background_color,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: FadeInImage.assetNetwork(
            placeholder: YZUtils.assetsImagePath('mine/mine_user_portrait'),
            image: userPortraitUrl,
            fit: BoxFit.contain,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 15.0)),
        SizedBox(
          height: 70.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: YZColors.text_title_color,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                '微信号：xxx',
                style: TextStyle(
                  color: YZColors.text_subtitle_color,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _scanWidget() {
    return Row(
      children: [
        SizedBox(
          width: 20.0,
          height: 20.0,
          child: Image(
              image: AssetImage(YZUtils.assetsImagePath('mine/mine_scan'))),
        ),
        const Padding(padding: EdgeInsets.only(left: 4.0)),
        SizedBox(
          width: 12.0,
          height: 30.0,
          child: Image(
              image: AssetImage(
                  YZUtils.assetsImagePath('common/common_arrow_right'))),
        ),
      ],
    );
  }
}
