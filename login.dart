import 'package:flutter/material.dart';
import 'package:flutter_project/forgotpassword.dart';
import 'package:flutter_project/home.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      // Validate input fields
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar('Error', 'All fields are required',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Save user information in SharedPreferences
      await saveUserInformation(
        emailController.text,
        passwordController.text,
      );

      // Navigate to home page after successful login
      Get.to(() => HomePage());
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> saveUserInformation(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await login();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navigate to Forgot Password Page
                Get.to(ForgotPasswordPage());
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
