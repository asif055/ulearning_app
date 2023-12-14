import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/application/provider/application_nav_notifier.dart';
import 'package:ulearning_app/pages/application/view/widgets/widgets.dart';


import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/app_shadows.dart';
import '../provider/application_nav_notifier.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read() is used for making changes
  int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreen(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              onTap: (value) {
               ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
             currentIndex: index,
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
        ),
      ),
    );
  }
}

