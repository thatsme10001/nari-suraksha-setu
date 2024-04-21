import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBJU9QUAIvfcjxrr4eN7OuZoQ79t_mDwXc",
            authDomain: "womensaftey-91b2c.firebaseapp.com",
            projectId: "womensaftey-91b2c",
            storageBucket: "womensaftey-91b2c.appspot.com",
            messagingSenderId: "850396075970",
            appId: "1:850396075970:web:c3c9b46e5361f7921e285b",
            measurementId: "G-M761KCVGV3"));
  } else {
    await Firebase.initializeApp();
  }
}
