
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/global_loader/global_loader.dart';

import '../../../common/models/user.dart';
import '../../../common/utils/popus_messages.dart';
import '../../../global.dart';
import '../../../main.dart';
import '../provider/sign_in_notifier.dart';
import '../repo/sign_in_repo.dart';


class SignInController {
  // late WidgetRef ref;

  SignInController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email.trim();
    String password = state.password.trim();

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo('Your email is empty');
      return;
    }
    if (state.password.isEmpty || password.isEmpty) {
      toastInfo('Your password is empty');
      return;
    }
    if (state.password.length < 6 || password.length < 6) {
      toastInfo('password must be greater than 6 character');
      return;
    }

    // sign in in firebase
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo('User not found');
      }
      // if email is not verified below condition mean

      if (!credential.user!.emailVerified) {
        toastInfo('You must verify your email address');
      }
      var user = credential.user;
      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
        print('user logged in');
      } else {
        toastInfo('Login error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        toastInfo('Your password is incorrect');
      } else if (e.code == 'user not found') {
        toastInfo('User not found');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to talk to the server

    // have local storage
    try {
      Global.storageService
          .setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode({
        'name': 'Asif', 'email': 'asifflux@gmail.com', 'age': 23,
      }));
      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    // redirect to new page
    navKey.currentState?.pushNamedAndRemoveUntil('/application', (route) => false);
  }
}
