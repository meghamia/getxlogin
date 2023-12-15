// import 'dart:io';
// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_project/login_controller.dart';
// import 'package:flutter_project/signup_controller.dart';
// import 'package:get/get.dart';
// import 'login_page.dart';
// import 'signup_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await FirebaseAppCheck.instance.activate();
//
//   Platform.isAndroid
//       ? await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyDrW7xB1H4xVYYpc-vAqxiUp-9Czb68Ars",
//       appId: "1:796835058608:android:1040734e10f66d74a33c75",
//       messagingSenderId: "796835058608",
//       projectId: "final-ef46c",
//     ),
//   )
//       : await Firebase.initializeApp();
//
//   Get.put(LoginController());
//   Get.put(SignUpController());
//
//   runApp(MyApp());
// }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     Get.lazyPut(() => LoginController());
// //     Get.put(SignUpController());
// //
// //     return GetMaterialApp(
// //       title: 'My App',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: LoginPage(), // Set the initial screen to LoginPage
// //     );
// //   }
// // }
// //
// //
//
//
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Initialize the LoginController
//     Get.lazyPut(() => LoginController());
//     Get.put(SignUpController()); // Add this line
//
//     return GetMaterialApp(
//       title: 'My App',
//       home: LoginPage(), // Set the initial page directly
//     );
//   }
// }
//




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project/constants.dart';
import 'package:flutter_project/home.dart';
import 'package:flutter_project/login.dart';
import 'package:flutter_project/signup.dart';

//import 'package:flutter_project/login.dart';


import 'package:get/get.dart';



import 'package:firebase_core/firebase_core.dart';




  void main()  {
    WidgetsFlutterBinding.ensureInitialized();
    Platform.isAndroid
        ? Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDrW7xB1H4xVYYpc-vAqxiUp-9Czb68Ars",
        appId: "1:796835058608:android:1040734e10f66d74a33c75",
        messagingSenderId: "796835058608",
        projectId: "final-ef46c",
        storageBucket: "final-ef46c.appspot.com",
      ),
    )
        :  Firebase.initializeApp();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'My App',

       home: SignupPage(),

      initialRoute: Constants.loginRoute,
      getPages: [
        GetPage(name: Constants.loginRoute, page: () => LoginPage()),
         GetPage(name: Constants.signupRoute, page: () => SignupPage()),
         GetPage(name: Constants.homeRoute, page: () => HomePage()),
      ],


    );

  }

}

