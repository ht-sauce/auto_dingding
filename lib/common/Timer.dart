// 定时器文件
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart'; // 缓存包
import 'package:auto_dingding/utils/utils.dart'; // 工具包

// 自动打卡
class AutoDaka {
  static void starts() async {
    // 定时器
    Timer.periodic(Duration(minutes: 30), (timer) {
      AutoDaka._timerDk();
    });
  }

  static void _timerDk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String morningTime = prefs.getString('morningTime');
    String nightTime = prefs.getString('nightTime');

    DateTime nowTime = new DateTime.now();
    String time = '${nowTime.hour}:${nowTime.minute}';

    if (time == morningTime) {
      toast(text: '早上打卡${morningTime}');
    }
    if (time == nightTime) {
      toast(text: '晚上打卡${nightTime}');
    }
  }
}
