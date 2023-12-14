import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: fontWeight,
    ),
  );
}

Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textUnderline({String text = 'your text'}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        color: AppColors.primaryText,
      ),
    ),
  );
}
