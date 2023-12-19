import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/app_textFields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import '../utils/app_colors.dart';
import '../utils/image_res.dart';

Widget searchBar() {
  return Row(
    children: [
      Container(
        width: 320.w,
        height: 45.h,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          boxBorder: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: appImage(imagePath: ImageRes.searchIcon),
            ),
            SizedBox(
              width: 280.w,
              height: 45.h,
              child: appTextFieldOnly(
                  width: 240, height: 40, hintText: 'search your course'),
            )
          ],
        ),
      )
    ],
  );
}
