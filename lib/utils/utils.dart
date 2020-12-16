import 'package:flutter/material.dart';
import 'package:auto_dingding/utils/Rpx.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast({
  String text
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromARGB(130, 0, 0, 0),
      textColor: Colors.white,
      fontSize: 30.rpx
  );
}