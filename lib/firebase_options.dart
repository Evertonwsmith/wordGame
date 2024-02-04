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
    apiKey: 'AIzaSyDCV-6CC4JpQd8c0dWaKRi8J8oYC0pBPb4',
    appId: '1:428749353952:web:680e0a3e0f006731753185',
    messagingSenderId: '428749353952',
    projectId: 'uix2024-dcdfe',
    authDomain: 'uix2024-dcdfe.firebaseapp.com',
    databaseURL: 'https://uix2024-dcdfe-default-rtdb.firebaseio.com',
    storageBucket: 'uix2024-dcdfe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCd8w7wB6fRpbDf63Zjpu2gNH_hUUW-QBM',
    appId: '1:428749353952:android:a7759705d5239977753185',
    messagingSenderId: '428749353952',
    projectId: 'uix2024-dcdfe',
    databaseURL: 'https://uix2024-dcdfe-default-rtdb.firebaseio.com',
    storageBucket: 'uix2024-dcdfe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0pH9asOhWFn1o-TJbSTILReU4KNIPs_s',
    appId: '1:428749353952:ios:f00c113cbbc14d38753185',
    messagingSenderId: '428749353952',
    projectId: 'uix2024-dcdfe',
    databaseURL: 'https://uix2024-dcdfe-default-rtdb.firebaseio.com',
    storageBucket: 'uix2024-dcdfe.appspot.com',
    iosBundleId: 'com.example.uxexplore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0pH9asOhWFn1o-TJbSTILReU4KNIPs_s',
    appId: '1:428749353952:ios:5c32ca7d81f0cbcd753185',
    messagingSenderId: '428749353952',
    projectId: 'uix2024-dcdfe',
    databaseURL: 'https://uix2024-dcdfe-default-rtdb.firebaseio.com',
    storageBucket: 'uix2024-dcdfe.appspot.com',
    iosBundleId: 'com.example.uxexplore.RunnerTests',
  );
}