import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/utils/global_loader/global_loader.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/sign_in/controller/sign_in_controller.dart';
import 'package:ulearning_app/pages/sign_in/view/widgets/sign_in_widget.dart';

import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textFields.dart';
import '../../../common/widgets/button_widgets.dart';
import '../provider/sign_in_notifier.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  // @override
  // void initState() {
  //   //sending ref context to the controller SignInController
  //
  // Future.delayed(Duration(seconds: 0), () {
  //   _controller = SignInController(ref);
  // });
  //   super.initState();
  // }
  @override
  void didChangeDependencies() {
    _controller = SignInController();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(),
            body: loader == false
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //top login buttons
                        thirdPartyLogin(),
                        //more login options message
                        Center(
                            child: text14Normal(
                                text: 'Or use your email account to login')),
                        SizedBox(
                          height: 50.h,
                        ),
                        // email text box
                        appTextField(
                          controller: _controller.emailController,
                          text: 'Email',
                          iconName: ImageRes.user,
                          hintText: 'Enter email',
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserEmailChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        // password text box
                        appTextField(
                          controller: _controller.passwordController,
                          text: 'Password',
                          iconName: ImageRes.lock,
                          hintText: 'Enter password',
                          obsecureText: true,
                          func: (value) => ref
                              .read(signInNotifierProvider.notifier)
                              .onUserPasswordChange(value),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25.w),
                          child: textUnderline(text: 'Forgot password?'),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        // app login buttons
                        Center(
                          child: appButton(
                            buttonName: 'Login',
                            func: () => _controller.handleSignIn(ref),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: appButton(
                              buttonName: 'Register',
                              isLogin: false,
                              context: context,
                              func: () {
                                Navigator.pushNamed(context, '/register');
                              }),
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
                  )),
      ),
    );
  }
}
