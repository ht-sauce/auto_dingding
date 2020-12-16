import 'package:flutter/material.dart';
import 'package:auto_dingding/utils/Rpx.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_dingding/common/LocalStorge.dart'; // 封装的缓存操作

import 'timeSeting.dart'; // 封装组件

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    DhtRpx.initialze(); // 注意main文件是无法起作用的，所以需要放在首页里面才可以产生效果

    return IndexState();
  }
}

TextStyle textStyle() {
  return TextStyle(color: Colors.white, fontSize: 30.rpx);
}

class InitTime {
  String morningTime; // 早上上班时间
  String nightTime; // 晚上下班时间
  InitTime(this.morningTime, this.nightTime);
}

class IndexState extends State<Index> {
  @override
  initState() {
    super.initState();
  }

  Future<InitTime> _initData() async {
    String morningTime = await LocalStorge.getData('morningTime') ?? '';
    String nightTime = await LocalStorge.getData('nightTime') ?? '';
    print({morningTime, nightTime});
    return InitTime(morningTime, nightTime);
  }

  _launchURL() async {
    //String url ="dingtalk://dingtalkclient/ding/home.html?";
    // 打开我的钉钉名片页面
    String url =
        'dingtalk://dingtalkclient/page/link?url=https%3A%2F%2Fh5.dingtalk.com%2Fzproject%2FbusinessCard.html%3Fdd_wk_noinset%3Dtrue%26profile%3D%40kgDOBezUvw%26cardToken%3D1569558aee%23%2F';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Flex(
            direction: Axis.vertical,
            children: <Widget>[
              TimeSeting(
                name: '早上时间',
                time: snapshot.data.morningTime,
                onTime: (val) => {LocalStorge.saveData('morningTime', val)},
              ),
              TimeSeting(
                  name: '晚上时间',
                  time: snapshot.data.nightTime,
                  onTime: (val) => {LocalStorge.saveData('nightTime', val)}),
              const Divider(
                color: Colors.redAccent,
              ),
              RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    _launchURL();
                  },
                  child: Text('测试打开钉钉', style: textStyle())),
            ],
          );
        });
  }
}
