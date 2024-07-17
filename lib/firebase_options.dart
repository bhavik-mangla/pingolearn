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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBgT3wOpqWosOwiDq26XDVjtFP4-nhSoFc',
    appId: '1:370766917795:web:33c301883c5f73b490cf16',
    messagingSenderId: '370766917795',
    projectId: 'pingolearn-bhavik',
    authDomain: 'pingolearn-bhavik.firebaseapp.com',
    storageBucket: 'pingolearn-bhavik.appspot.com',
    measurementId: 'G-D348SM9JPX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQiZjmuVEemNctiYnQNhjoQZVwKeAMBes',
    appId: '1:370766917795:android:09c0004b726d46c290cf16',
    messagingSenderId: '370766917795',
    projectId: 'pingolearn-bhavik',
    storageBucket: 'pingolearn-bhavik.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMK4TAA2jFY6wLoTsQo4nWQDwDUWaqXWk',
    appId: '1:370766917795:ios:6b33784040768aac90cf16',
    messagingSenderId: '370766917795',
    projectId: 'pingolearn-bhavik',
    storageBucket: 'pingolearn-bhavik.appspot.com',
    iosBundleId: 'com.example.pingolearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMK4TAA2jFY6wLoTsQo4nWQDwDUWaqXWk',
    appId: '1:370766917795:ios:6b33784040768aac90cf16',
    messagingSenderId: '370766917795',
    projectId: 'pingolearn-bhavik',
    storageBucket: 'pingolearn-bhavik.appspot.com',
    iosBundleId: 'com.example.pingolearn',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBgT3wOpqWosOwiDq26XDVjtFP4-nhSoFc',
    appId: '1:370766917795:web:b70776a7ecbc6d4890cf16',
    messagingSenderId: '370766917795',
    projectId: 'pingolearn-bhavik',
    authDomain: 'pingolearn-bhavik.firebaseapp.com',
    storageBucket: 'pingolearn-bhavik.appspot.com',
    measurementId: 'G-S16VB5QCFM',
  );
}
