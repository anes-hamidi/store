// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members, depend_on_referenced_packages
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
    apiKey: 'AIzaSyDTcrJm6GfhW5XyxSwkK2YTQ0tPWqxEJXw',
    appId: '1:871546738271:web:eb61369d90efb6c2eeedea',
    messagingSenderId: '871546738271',
    projectId: 'hama-bca61',
    authDomain: 'hama-bca61.firebaseapp.com',
    storageBucket: 'hama-bca61.appspot.com',
    measurementId: 'G-D195CD46E2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsVNyGqZRlagiDL8o--nDS9Y4rUi4K1TM',
    appId: '1:871546738271:android:cdfc0e437d45880ceeedea',
    messagingSenderId: '871546738271',
    projectId: 'hama-bca61',
    storageBucket: 'hama-bca61.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2qSFbVoiVSedenyVQqF26N9Rtc57xevw',
    appId: '1:871546738271:ios:455769850a720872eeedea',
    messagingSenderId: '871546738271',
    projectId: 'hama-bca61',
    storageBucket: 'hama-bca61.appspot.com',
    iosClientId: '871546738271-gl1nhs120iovsrf51rjnons15ju596lq.apps.googleusercontent.com',
    iosBundleId: 'com.example.setAndGet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2qSFbVoiVSedenyVQqF26N9Rtc57xevw',
    appId: '1:871546738271:ios:455769850a720872eeedea',
    messagingSenderId: '871546738271',
    projectId: 'hama-bca61',
    storageBucket: 'hama-bca61.appspot.com',
    iosClientId: '871546738271-gl1nhs120iovsrf51rjnons15ju596lq.apps.googleusercontent.com',
    iosBundleId: 'com.example.setAndGet',
  );
}
