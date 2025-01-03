// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA1EP21z1QRLcf8HMQB5d_BjKNz9nnP9Zc',
    appId: '1:877058521025:web:19f0b384725fc20cae6140',
    messagingSenderId: '877058521025',
    projectId: 'telepatia-interview',
    authDomain: 'telepatia-interview.firebaseapp.com',
    storageBucket: 'telepatia-interview.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5Xevl1b7NWLIaOCuRuXqzUaZXONjLvJg',
    appId: '1:877058521025:android:396d93e39a499e99ae6140',
    messagingSenderId: '877058521025',
    projectId: 'telepatia-interview',
    storageBucket: 'telepatia-interview.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz617djnlc_Z5gGJ2PT_e8e83aevbxezM',
    appId: '1:877058521025:ios:f71a6d496ea63a40ae6140',
    messagingSenderId: '877058521025',
    projectId: 'telepatia-interview',
    storageBucket: 'telepatia-interview.firebasestorage.app',
    iosBundleId: 'com.example.telepatia',
  );
}
