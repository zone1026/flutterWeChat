// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:wechat/mine/widget/mine_body.dart';

class YZMinePageWidget extends StatefulWidget {
  const YZMinePageWidget({Key? key}) : super(key: key);
  @override
  _YZMinePageWidgetState createState() => _YZMinePageWidgetState();
}

class _YZMinePageWidgetState extends State<YZMinePageWidget>
    with SingleTickerProviderStateMixin {
  double _topMarin = 0.0;
  bool _hideTop = true;

  final _contentHeight = window.physicalSize.height / 2.0 - 64.0;

  /// stream流机制(发布订阅模式)
  final StreamController<double> _streamController = StreamController();

  late Animation<double> _animation;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 初始化数据
    initData();
  }

  // 初始化数据
  void initData() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
          () => PanGestureRecognizer(),
          (PanGestureRecognizer instance) {
            instance
              ..onStart = (details) {
                print('onStart');
              }
              ..onUpdate = (details) {
                print('onUpdate : ${details.delta}');
                // 发布事件
                _streamController.sink.add(
                  _topMarin += details.delta.dy * (_hideTop ? 0.5 : 0.2),
                );
              }
              ..onEnd = (details) {
                print('onEnd');
                _didHideTopWhenEndPanning();
              }
              ..onCancel = () {
                print('onCancel');
              }
              ..onDown = (details) {
                print('onDown');
              };
          },
        ),
      },
      // 当 StreamController 改变 topMarin 时，这里就会监听到，从而刷新控件。
      child: StreamBuilder<double>(
        builder: (context, snapshot) {
          return YZMineBodyWidget(topMarin: _topMarin);
        },
        stream: _streamController.stream,
        initialData: _topMarin,
      ),
    );
  }

  /// 滑动结束
  void _didHideTopWhenEndPanning() {
    if (_hideTop == false) {
      if (_topMarin < _contentHeight - 100.0) {
        _hideTopWhenEndPanning();
      } else {
        _showTopWhenEndPanning();
      }
    } else {
      if (_topMarin > 200.0) {
        _showTopWhenEndPanning();
      } else {
        _hideTopWhenEndPanning();
      }
    }
  }

  /// 隐藏 Header 动画
  void _hideTopWhenEndPanning() {
    _initAnimation(true);
    _startAnimation();
  }

  /// 展示 Header 动画
  void _showTopWhenEndPanning() {
    _initAnimation(false);
    _startAnimation();
  }

  /// 初始化动画
  void _initAnimation(bool hide) {
    _animation = Tween<double>(
      begin: _topMarin,
      end: hide ? 0.0 : _contentHeight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ))
      ..addListener(
        () {
          _streamController.sink.add(_topMarin = _animation.value);
        },
      )
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _streamController.sink
                .add(_topMarin = hide ? 0.0 : _contentHeight - 300.0);
            _hideTop = hide;
          }
        },
      );
  }

  /// 执行动画
  Future _startAnimation() async {
    try {
      await _controller.forward(from: 0).orCancel;
    } on TickerCanceled {
      print('TickerCanceled');
    }
  }
}
