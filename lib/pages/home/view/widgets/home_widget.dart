
import 'package:flutter/cupertino.dart';

import '../../../../common/utils/app_colors.dart';
import '../../../../common/widgets/text_widgets.dart';
import '../../../../global.dart';

Widget userName() {
  return  Container(
    child: text24Normal(
      text: Global.storageService.getUserProfile().name!,
      fontWeight: FontWeight.bold,
    ),
  );
}
Widget helloText() {
  return Container(
    child: text24Normal(
      text: 'Hello',
      color: AppColors.primaryFourElementText,
      fontWeight: FontWeight.bold,
    ),
  );
}