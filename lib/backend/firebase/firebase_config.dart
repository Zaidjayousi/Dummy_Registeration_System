import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAe0CdO20p-vbV2iJ_VGPit_2Va67Afsdc",
            authDomain: "sectionsswapping-ebc52.firebaseapp.com",
            projectId: "sectionsswapping-ebc52",
            storageBucket: "sectionsswapping-ebc52.appspot.com",
            messagingSenderId: "728100097799",
            appId: "1:728100097799:web:d9797e27a386d70231bfa2",
            measurementId: "G-9CX98T8XJR"));
  } else {
    await Firebase.initializeApp();
  }
}
