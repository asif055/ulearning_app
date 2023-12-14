import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import '../../../../common/utils/image_res.dart';
import '../../../home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  //1st item
  BottomNavigationBarItem(
    icon: _bottomContainer(),
    label: 'Home',
    backgroundColor: AppColors.primaryBackground,
    activeIcon: appImageWithColor(
      imagePath: ImageRes.home,
      color: AppColors.primaryElement,
    ),
  ),

  // 2nd item
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.search),
    label: 'search',
    backgroundColor: AppColors.primaryBackground,
    activeIcon: appImageWithColor(
      imagePath: ImageRes.search,
      color: AppColors.primaryElement,
    ),
  ),

  // 3rd item
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.play),
    label: 'Play',
    backgroundColor: AppColors.primaryBackground,
    activeIcon: appImageWithColor(
      imagePath: ImageRes.play,
      color: AppColors.primaryElement,
    ),
  ),

  // 4rd item
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.message),
    label: 'Message',
    backgroundColor: AppColors.primaryBackground,
    activeIcon: appImageWithColor(
      imagePath: ImageRes.message,
      color: AppColors.primaryElement,
    ),
  ),

  // 5th item
  BottomNavigationBarItem(
    icon: _bottomContainer(imagePath: ImageRes.profile),
    label: 'Profile',
    backgroundColor: AppColors.primaryBackground,
    activeIcon: appImageWithColor(
      imagePath: ImageRes.profile,
      color: AppColors.primaryElement,
    ),
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagePath = ImageRes.home,
  Color color = AppColors.primaryElement,
}) {
  return SizedBox(
    width: 15.w,
    height: 15.h,
    child: appImageWithColor(
      imagePath: imagePath,
      color: AppColors.primaryFourElementText,
    ),
  );
}

// return screen related to each page

Widget appScreen({int index = 0}) {
  List<Widget> screens = [
    const Home(),
    Center(
        child: appImage(imagePath: ImageRes.search, width: 100, height: 100)),
    Center(child: appImage(imagePath: ImageRes.play, width: 100, height: 100)),
    Center(
        child: appImage(imagePath: ImageRes.message, width: 100, height: 100)),
    Center(
        child: appImage(imagePath: ImageRes.profile, width: 100, height: 100)),
  ];
  return screens[index];
}
