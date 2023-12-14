// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvqkWaVIB6lJvcKOnlqK-vsDi6mjIZo9o',
    appId: '1:363499513465:web:ad769a1e314b3919f916a8',
    messagingSenderId: '363499513465',
    projectId: 'ulearning-app-312ab',
    authDomain: 'ulearning-app-312ab.firebaseapp.com',
    storageBucket: 'ulearning-app-312ab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6ZaGYlGY-TQkdq93RAELLBRlsq7haatY',
    appId: '1:363499513465:android:f17739bf44d17a1bf916a8',
    messagingSenderId: '363499513465',
    projectId: 'ulearning-app-312ab',
    storageBucket: 'ulearning-app-312ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSDDnwDHmmOF6GfTrYTWGUDodeyw8laIU',
    appId: '1:363499513465:ios:94a653071b227090f916a8',
    messagingSenderId: '363499513465',
    projectId: 'ulearning-app-312ab',
    storageBucket: 'ulearning-app-312ab.appspot.com',
    iosBundleId: 'com.example.ulearningApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSDDnwDHmmOF6GfTrYTWGUDodeyw8laIU',
    appId: '1:363499513465:ios:0f3b5bc563b9f046f916a8',
    messagingSenderId: '363499513465',
    projectId: 'ulearning-app-312ab',
    storageBucket: 'ulearning-app-312ab.appspot.com',
    iosBundleId: 'com.example.ulearningApp.RunnerTests',
  );
}
