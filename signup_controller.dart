// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SignUpController extends GetxController {
//   RxString email = ''.obs;
//   RxString password = ''.obs;
//   RxString name = ''.obs;
//   RxBool obscureText = true.obs;
//
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   registration() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email.value,
//         password: password.value,
//       );
//
//       // Get the currently authenticated user
//       User? user = userCredential.user;
//
//       // Save user data to Firestore
//       await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
//         'name': name.value,
//         'email': email.value,
//         // Add other user data fields as needed
//       });
//
//       Get.snackbar(
//         "Registered Successfully",
//         "Registration Successful!",
//         backgroundColor: Colors.green,
//         snackPosition: SnackPosition.BOTTOM,
//       );
//
//       // Clear the text fields after successful registration
//       name.value = '';
//       email.value = '';
//       password.value = '';
//
//       // Navigate to the home page or perform other actions as needed
//       Get.toNamed('/home'); // Example using GetX for navigation
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         Get.snackbar(
//           "Registration Failed",
//           "Password provided is too weak.",
//           backgroundColor: Colors.orangeAccent,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else if (e.code == 'email-already-in-use') {
//         Get.snackbar(
//           "Registration Failed",
//           "Account already exists.",
//           backgroundColor: Colors.orangeAccent,
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     }
//   }
// }

// signup_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter_project/home.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

class SignupController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> signUp() async {
    try {
      isLoading(true);

      // Validate input fields
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        Get.snackbar('Error', 'All fields are required',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Create user in Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // Store user information in Firestore
      await FirebaseFirestore.instance
          .collection(Constants.usersCollection)
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text,
        'email': emailController.text,
        // Add other fields if needed
      });

      // Save user information in SharedPreferences
      await saveUserInformation(
        nameController.text,
        emailController.text,
      );

      // Display success message
      Get.snackbar('Success', 'Account created successfully',
          snackPosition: SnackPosition.BOTTOM);

      // Navigate to home page after successful signup
      Get.off(() => HomePage());

      isLoading(false);
    } catch (error) {
      isLoading(false);
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveUserInformation(String name, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.sharedPreferencesNameKey, name);
    prefs.setString(Constants.sharedPreferencesEmailKey, email);
  }
}
