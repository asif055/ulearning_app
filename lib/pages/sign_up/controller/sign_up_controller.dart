import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/global_loader/global_loader.dart';
import 'package:ulearning_app/common/utils/popus_messages.dart';

import '../provider/register_notifier.dart';
import '../repo/sign_up_repo.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.username.trim();
    String email = state.email.trim();
    String password = state.password.trim();
    String rePassword = state.rePassword.trim();

    if (state.username.isEmpty || name.isEmpty) {
      toastInfo('Your name is empty');
      return;
    }
    if (state.username.length < 6 || name.length < 6) {
      toastInfo('Username must be 6 character');
      return;
    }
    if (state.email.trim().isEmpty || email.trim().isEmpty) {
      toastInfo('Your email is empty');
      return;
    }
    if (state.password.length < 6 || password.length < 6) {
      toastInfo('password must be greater than 6 character');
      return;
    }

    if ((state.password.isEmpty || state.rePassword.isEmpty) ||
        password.isEmpty ||
        rePassword.isEmpty) {
      toastInfo('Your password is empty');
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo('Your password does not match');
      return;
    }

    // show the loading icon
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);
    try {
      final credential = await SignUpRepo.firebaseSignUp(email, password);
      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        // In future get server photo url
        // set user photo url
        toastInfo(
            'An email has been send to verify your account. Please confirm the email address');
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('The password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('This email address is already registered');
      } else if(e.code == 'user not found') {
        toastInfo('User not found');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    //show the register page
    ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
  }
}
