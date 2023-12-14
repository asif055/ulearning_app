import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/provider/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/view/widget/widgets.dart';


class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // showing our three welcome pages
                PageView(
                  // page-view occupy the hole screen
                  onPageChanged: (value) {
                    if (kDebugMode) {
                      print('_____my index value is $value');
                    }
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                  controller: _controller,
                  children: [
                    appOnBoardingPage(
                      _controller,
                      imagePath: 'assets/images/reading.png',
                      title: 'First See Learning',
                      subTitle:
                          'Forget about the paper, now learning all in one place',
                      index: 1,
                      context: context,
                    ),
                    // second page
                    appOnBoardingPage(
                      _controller,
                      imagePath: 'assets/images/man.png',
                      title: 'Connect With Everyone',
                      subTitle:
                          "Always keep in touch with your tutor and freinds. Let's get connected",
                      index: 2,
                      context: context,
                    ),
                    appOnBoardingPage(
                      _controller,
                      imagePath: 'assets/images/boy.png',
                      title: 'Always fascinated Learning',
                      subTitle:
                          "Anywhere, anytime. The time is at your discretion. So study wherever you can",
                      index: 3,
                      context: context,
                    ),
                  ],
                ),
                // for showing dots indicator
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(20.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// first way to maintain our state
// final indexProvider = StateProvider<int>((ref) => 0);
//second way is riverpod generator
