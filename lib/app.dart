import 'package:flutter/material.dart';

import 'package:auto_dingding/components/globalPage/index.dart';

import './page/index/index.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '钉钉自动打卡',
      color: Colors.red,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => GlobalPage(
          page: Index(),
          title: '钉钉自动打卡',
        ), // 默认根页面可以替代home选项
      },
    );
  }
}