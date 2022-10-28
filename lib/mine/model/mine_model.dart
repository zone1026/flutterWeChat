import 'package:wechat/util/utils.dart';

class YZMineModel {}

/// 我的页面item类型
enum YZMineItemType {
  /// section间距item类型
  padding,

  /// 支付item类型
  pay,

  /// 收藏item类型
  collection,

  /// 相册item类型
  album,

  /// 卡包item类型
  wallet,

  /// 表情item类型
  face,

  /// 设置item类型
  setting,
}

class YZMineItemModel {
  /// 我的页面item类型
  late YZMineItemType type;

  /// item icon 图片相对路径+名称
  late String icon;

  /// item 标题
  late String title;

  /// 是否有分割线
  bool hasDivide = false;

  YZMineItemModel(YZMineItemType itemType) {
    type = itemType;
    if (itemType != YZMineItemType.padding) {
      icon = _iconByItemType();
      title = _titleByItemType();
      hasDivide = _hasDivideByItemType();
    }
  }

  /// 根据item类型设置icon数据
  String _iconByItemType() {
    String value = 'unknown';
    switch (type) {
      case YZMineItemType.pay:
        value = YZUtils.assetsImagePath('mine/mine_pay');
        break;
      case YZMineItemType.collection:
        value = YZUtils.assetsImagePath('mine/mine_collection');
        break;
      case YZMineItemType.album:
        value = YZUtils.assetsImagePath('mine/mine_album');
        break;
      case YZMineItemType.wallet:
        value = YZUtils.assetsImagePath('mine/mine_wallet');
        break;
      case YZMineItemType.face:
        value = YZUtils.assetsImagePath('mine/mine_face');
        break;
      case YZMineItemType.setting:
        value = YZUtils.assetsImagePath('mine/mine_setting');
        break;
      default:
    }

    return value;
  }

  /// 根据item类型设置title数据
  String _titleByItemType() {
    String value = 'unknown';
    switch (type) {
      case YZMineItemType.pay:
        value = '支付';
        break;
      case YZMineItemType.collection:
        value = '收藏';
        break;
      case YZMineItemType.album:
        value = '相册';
        break;
      case YZMineItemType.wallet:
        value = '卡包';
        break;
      case YZMineItemType.face:
        value = '表情';
        break;
      case YZMineItemType.setting:
        value = '设置';
        break;
      default:
    }

    return value;
  }

  /// 根据item类型设置title数据
  bool _hasDivideByItemType() {
    bool value = false;
    switch (type) {
      case YZMineItemType.collection:
      case YZMineItemType.album:
      case YZMineItemType.wallet:
        value = true;
        break;
      default:
    }

    return value;
  }
}
