// // forgot_password_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_project/forgotpasswordcontroller.dart';
// import 'package:get/get.dart';
//
// class ForgotPasswordPage extends StatelessWidget {
//   final ForgotPasswordController forgotPasswordController =
//   Get.put(ForgotPasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: forgotPasswordController.emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => forgotPasswordController.resetPassword(),
//               child: Obx(() {
//                 return forgotPasswordController.isLoading.value
//                     ? CircularProgressIndicator()
//                     : Text('Reset Password');
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// forgot_password_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_project/forgotpasswordcontroller.dart';
import 'package:get/get.dart';


class ForgotPasswordPage extends StatelessWidget {
  final ForgotPasswordController forgotPasswordController =
  Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: forgotPasswordController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => forgotPasswordController.resetPassword(),
              child: Obx(() {
                return forgotPasswordController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Reset Password');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
