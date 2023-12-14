import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';

import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

Widget appOnBoardingPage(
  PageController controller, {
  String imagePath = 'assets/images/reading.png',
  String title = '',
  String subTitle = '',
  index = 0,
      required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(text: subTitle),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

//next button widget onboarding screen

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
      } else {
        // remember if we are first time or not
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        Navigator.pushNamed(context, '/sign_in');
      }
    },
    child: Container(
      width: 325,
      height: 55,
      margin: const EdgeInsets.only(
        top: 90,
        left: 25,
        right: 25,
      ),
      decoration: appBoxShadow(),
      child: Center(
        child: text16Normal(text: index < 3 ? 'next' : 'Get Started', color: Colors.white),
      ),
    ),
  );
}
