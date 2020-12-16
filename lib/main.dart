import 'package:flutter/material.dart';
import 'app.dart';
import 'package:auto_dingding/common/Timer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 避免报错
  AutoDaka.starts(); // 自动打卡

  runApp(MyApp());
}
