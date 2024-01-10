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
    apiKey: 'AIzaSyDx78lEfmnzSYhJikQ9XCovixjDKByo1Ew',
    appId: '1:777026060461:web:9c0a020a34bfbe01488624',
    messagingSenderId: '777026060461',
    projectId: 'my-notes-app-c4806',
    authDomain: 'my-notes-app-c4806.firebaseapp.com',
    storageBucket: 'my-notes-app-c4806.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKzM8n5Aq4ZLaEdO0-RE2qkQfjqfUojYc',
    appId: '1:777026060461:android:5f2b375ecea2db7a488624',
    messagingSenderId: '777026060461',
    projectId: 'my-notes-app-c4806',
    storageBucket: 'my-notes-app-c4806.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIN6GTLZ2zw0LvpDQro_Cm19Hg1fV5pPA',
    appId: '1:777026060461:ios:09049b78e2e0dca4488624',
    messagingSenderId: '777026060461',
    projectId: 'my-notes-app-c4806',
    storageBucket: 'my-notes-app-c4806.appspot.com',
    iosBundleId: 'com.example.mynotesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIN6GTLZ2zw0LvpDQro_Cm19Hg1fV5pPA',
    appId: '1:777026060461:ios:136bcb74dbc9eb46488624',
    messagingSenderId: '777026060461',
    projectId: 'my-notes-app-c4806',
    storageBucket: 'my-notes-app-c4806.appspot.com',
    iosBundleId: 'com.example.mynotesapp.RunnerTests',
  );
}
