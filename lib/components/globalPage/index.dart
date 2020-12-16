import 'package:flutter/material.dart';

// 关于key的文章：https://blog.csdn.net/weixin_43901866/article/details/88980514
class GlobalPage extends StatelessWidget {
  GlobalPage({
    Key key, // 全局key
    this.page,
    this.title,
  }) : super(key: key);
  final Widget page;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: page,
    );
  }
}
