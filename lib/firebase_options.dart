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
    apiKey: 'AIzaSyC5kgJt9aaPm5OTGqmQBQAnoKuQ3UhZQ9Y',
    appId: '1:673572461580:web:f3d055cf1f6959e1862229',
    messagingSenderId: '673572461580',
    projectId: 'clinic-f38ad',
    authDomain: 'clinic-f38ad.firebaseapp.com',
    storageBucket: 'clinic-f38ad.firebasestorage.app',
    measurementId: 'G-08TN1CYR1M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmUqYkdsd2Vjv9xREwUBVfei4ndvyCmQU',
    appId: '1:673572461580:android:5ebe5eec424748da862229',
    messagingSenderId: '673572461580',
    projectId: 'clinic-f38ad',
    storageBucket: 'clinic-f38ad.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNWZaS5YqERq6a0IbPpd6v1LAeMW_BAA0',
    appId: '1:673572461580:ios:393ef1a5958e9436862229',
    messagingSenderId: '673572461580',
    projectId: 'clinic-f38ad',
    storageBucket: 'clinic-f38ad.firebasestorage.app',
    iosBundleId: 'com.example.clinic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNWZaS5YqERq6a0IbPpd6v1LAeMW_BAA0',
    appId: '1:673572461580:ios:393ef1a5958e9436862229',
    messagingSenderId: '673572461580',
    projectId: 'clinic-f38ad',
    storageBucket: 'clinic-f38ad.firebasestorage.app',
    iosBundleId: 'com.example.clinic',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC5kgJt9aaPm5OTGqmQBQAnoKuQ3UhZQ9Y',
    appId: '1:673572461580:web:2032b3807bd52628862229',
    messagingSenderId: '673572461580',
    projectId: 'clinic-f38ad',
    authDomain: 'clinic-f38ad.firebaseapp.com',
    storageBucket: 'clinic-f38ad.firebasestorage.app',
    measurementId: 'G-LL2H8RTHG8',
  );
}
