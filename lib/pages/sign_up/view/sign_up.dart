import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_up/controller/sign_up_controller.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/utils/global_loader/global_loader.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textFields.dart';
import '../../../common/widgets/button_widgets.dart';
import '../provider/register_notifier.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    //sending ref context to the controller SignUpController
    _controller = SignUpController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    // regProvider
    final loaderProvider = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(titleName: 'SignUp'),
          body: loaderProvider == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      //more login options message
                      Center(
                          child: text14Normal(
                              text: "Enter your details below & free sign up")),
                      SizedBox(
                        height: 50.h,
                      ),
                      //user name text box
                      appTextField(
                        text: 'User name',
                        iconName: ImageRes.user,
                        hintText: 'Enter username',
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserNameChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //email text box
                      appTextField(
                        text: 'Email',
                        iconName: ImageRes.user,
                        hintText: 'Enter email',
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //password text box
                      appTextField(
                        text: 'Password',
                        iconName: ImageRes.lock,
                        hintText: 'Enter password',
                        obsecureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //password text box
                      appTextField(
                        text: 'Confirm your Password',
                        iconName: ImageRes.lock,
                        hintText: 'Confirm password',
                        obsecureText: true,
                        func: (value) => ref
                            .read(registerNotifierProvider.notifier)
                            .onUserRePasswordChange(value),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      //forgot text
                      Container(
                        margin: EdgeInsets.only(left: 25.w),
                        child: text14Normal(
                            text:
                                "By creating an account you are agreeing with our terms and conditions"),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      // app login buttons
                      Center(
                        child: appButton(
                          buttonName: 'Register',
                          isLogin: true,
                          context: context,
                          func: () => _controller.handleSignUp(),
                        ),
                      ),
                      //app register buttons
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
