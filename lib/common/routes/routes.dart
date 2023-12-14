import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/pages/sign_up/view/sign_up.dart';

import '../../global.dart';
import '../../pages/application/view/application.dart';
import '../../pages/home/view/home.dart';
import '../../pages/sign_in/view/sign_in.dart';
import '../../pages/welcome/view/welcome.dart';
import 'app_routes_name.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRouteNames.WELCOME, page: Welcome()),
      RouteEntity(path: AppRouteNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRouteNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRouteNames.APPLICATION, page: const Application()),
      RouteEntity(path: AppRouteNames.HOME, page: const Home()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (kDebugMode) {
      print('Clicked Route is: $settings.name');
    }
    if (settings.name != null) {
      var results = routes().where((element) => element.path == settings.name);
      if (results.isNotEmpty) {
        //if we used this is first time or not
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();  // return true/false

        if (results.first.path == AppRouteNames.WELCOME && deviceFirstTime) {

          bool isLoggedIn = Global.storageService.isLoggedIn();
          if(isLoggedIn) {
            if (kDebugMode) {
              print('is logged in $isLoggedIn');
            }
            return MaterialPageRoute(builder: (_) => const Application(), settings: settings);
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            print('App run first time');
          }
          return MaterialPageRoute(
            builder: (_) => results.first.page,
            settings: settings,
          );
        }
      }
    }
    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;

  RouteEntity({
    required this.path,
    required this.page,
  });
}
