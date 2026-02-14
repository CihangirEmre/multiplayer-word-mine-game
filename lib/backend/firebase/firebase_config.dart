import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDWh2TFsHZAtw1NibkoqO1zcavHT_dZ-JE",
            authDomain: "kelimelik-yazlab.firebaseapp.com",
            projectId: "kelimelik-yazlab",
            storageBucket: "kelimelik-yazlab.firebasestorage.app",
            messagingSenderId: "59681920405",
            appId: "1:59681920405:web:809eac1c771840e225129c",
            measurementId: "G-KCFT4ZXC08"));
  } else {
    await Firebase.initializeApp();
  }
}
