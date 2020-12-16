import 'package:flutter/material.dart';
import 'package:auto_dingding/utils/Rpx.dart';

class TimeSeting extends StatefulWidget {
  TimeSeting({Key key, @required this.name, this.time, this.onTime})
      : super(key: key);
  String name = '设置时间';
  String time; // 上班时间
  final onTime;

  @override
  State<StatefulWidget> createState() {
    return TimeSetingState();
  }
}

// 统一字体样式
TextStyle textStyle() {
  return TextStyle(color: Colors.white, fontSize: 30.rpx);
}

class TimeSetingState extends State<TimeSeting> {
  TimeOfDay time = new TimeOfDay.now();

  void _initData() {
    // print(widget.time);
    List list = widget.time.split(':');
    if (list.length == 2) {
      int hour = int.parse(list[0]);
      int minute = int.parse(list[1]);
      time = TimeOfDay(hour: hour, minute: minute);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            width: 750.rpx,
            height: 100.rpx,
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(30.rpx),
              child: Text(
                widget.time,
                style: textStyle(),
              ),
            )),
        RaisedButton(
          color: Colors.blue,
          onPressed: () async {
              time = await showTimePicker(
                  context: context,
                  initialTime: time ?? new TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                  cancelText: '取消',
                  confirmText: '确定');
              if (time == null) {
                _initData();
                return false;
              }
              String t = '${time.hour}:${time.minute}';
              setState(() {
                widget.time = t;
                time = time;
              });
              widget.onTime(t);
          },
          child: Text('${widget.name}', style: textStyle()),
        ),
      ],
    );
  }
}
