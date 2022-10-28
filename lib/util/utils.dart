import 'package:flutter/material.dart';

class YZUtils {
  /// 图片资源路径
  ///
  /// name 图片在assets/images/下的路径+图片名称；如：'tab/tab_mine'
  static String assetsImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }
}
