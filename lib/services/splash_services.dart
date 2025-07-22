// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../resources/routes/routes_name.dart';
//
//
// class SplashService {
//   void isLogin(BuildContext context) {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//
//     try {
//       final User? user = auth.currentUser;
//
//       Timer(const Duration(seconds: 4), () {
//         if (user != null) {
//           Get.offAllNamed(RoutesName.homeScreen);
//         } else {
//           Get.offAllNamed(RoutesName.chooseLanguage);
//         }
//       });
//     } catch (e) {
//       Get.snackbar("Error", "Authentication check failed: $e",
//           snackPosition: SnackPosition.BOTTOM);
//       Timer(const Duration(seconds: 4), () {
//         Get.offNamed(RoutesName.loginScreen);
//       });
//     }
//   }
// }
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/routes/routes_name.dart';

class SplashService {
  void isLogin(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool isLanguageSelected = prefs.getBool('language_selected') ?? false;
    final User? user = auth.currentUser;

    Timer(const Duration(seconds: 4), () {
      if (!isLanguageSelected) {
        Get.offAllNamed(RoutesName.chooseLanguage);
      } else if (user != null) {
        Get.offAllNamed(RoutesName.homeScreen);
      } else {
        Get.offAllNamed(RoutesName.loginScreen);
      }
    });
  }
}
