// // login_controller.dart
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'constants.dart';
//
// class LoginController extends GetxController {
//   final RxBool isLoading = false.obs;
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> login() async {
//     try {
//       isLoading(true);
//
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//
//       // If login is successful, save the login state locally and in Firestore
//       await saveLoginState(userCredential.user?.uid ?? '');
//
//       // Navigate to the home screen
//       Get.offAllNamed(Constants.homeRoute);
//     } catch (e) {
//       // Handle login failure
//       print('Login failed: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Future<void> saveLoginState(String userId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('users');
//
//     // Save login state locally
//     await prefs.setBool(Constants.isLoggedInKey, true);
//
//     // Save login state in Firestore
//     await users.doc(userId).set({
//       'isLoggedIn': true,
//     });
//   }
//
//   checkLocalLoginState() {}
// }

// login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    try {
      isLoading(true);

      // Validate input fields
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar('Error', 'All fields are required',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Sign in with Firebase Authentication
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // Navigate to home page after successful login
      Get.offAllNamed(Constants.homeRoute);

      isLoading(false);
    } catch (error) {
      isLoading(false);
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
