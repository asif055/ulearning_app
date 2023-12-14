import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

// positional optional parameter

toastInfo(String msg, {Color bg = Colors.blue, Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 2,
    fontSize: 16.sp,
    backgroundColor: bg,
    textColor: textColor,
    gravity: ToastGravity.TOP,
  );
}
