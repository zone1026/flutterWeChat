import 'package:wechat/util/utils.dart';

class YZFindModel {}

/// item 类型
enum YZFindItemType {
  /// section分割Padding单位
  padding,

  /// 朋友圈
  friend,

  /// 扫一扫
  scan,

  /// 看一看
  look,

  /// 搜一搜
  search,

  /// 游戏
  game,

  /// 小程序
  smallProject
}

class YZFindItemModel {
  /// item icon 图片相对路径+名称
  late String icon;

  /// item 标题
  late String title;

  /// 是否有分割线
  bool hasDivide = false;

  /// item 类型
  late YZFindItemType type;

  YZFindItemModel(YZFindItemType itemType) {
    type = itemType;
    if (itemType != YZFindItemType.padding) {
      icon = _iconByItemType();
      title = _titleByItemType();
      hasDivide = _hasDivideByItemType();
    }
  }

  /// 根据item类型设置icon数据
  String _iconByItemType() {
    String value = 'unknown';
    switch (type) {
      case YZFindItemType.friend:
        value = YZUtils.assetsImagePath('find/find_friend');
        break;
      case YZFindItemType.scan:
        value = YZUtils.assetsImagePath('find/find_scan');
        break;
      case YZFindItemType.look:
        value = YZUtils.assetsImagePath('find/find_look');
        break;
      case YZFindItemType.search:
        value = YZUtils.assetsImagePath('find/find_search');
        break;
      case YZFindItemType.game:
        value = YZUtils.assetsImagePath('find/find_game');
        break;
      case YZFindItemType.smallProject:
        value = YZUtils.assetsImagePath('find/find_small_project');
        break;
      default:
    }

    return value;
  }

  /// 根据item类型设置title数据
  String _titleByItemType() {
    String value = 'unknown';
    switch (type) {
      case YZFindItemType.friend:
        value = '朋友圈';
        break;
      case YZFindItemType.scan:
        value = '扫一扫';
        break;
      case YZFindItemType.look:
        value = '看一看';
        break;
      case YZFindItemType.search:
        value = '搜一搜';
        break;
      case YZFindItemType.game:
        value = '游戏';
        break;
      case YZFindItemType.smallProject:
        value = '小程序';
        break;
      default:
    }

    return value;
  }

  /// 根据item类型设置title数据
  bool _hasDivideByItemType() {
    bool value = false;
    switch (type) {
      case YZFindItemType.look:
        value = true;
        break;
      default:
    }

    return value;
  }
}
