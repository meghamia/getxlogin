//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_project/login.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'constants.dart';
//
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Show a confirmation dialog when trying to leave the Home Page
//         return await _showLogoutConfirmationDialog(context);
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home Screen'),
//         ),
//         body: FutureBuilder(
//           future: _getUserData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Name: ${snapshot.data?[Constants.sharedPreferencesNameKey]}'),
//                   Text('Email: ${snapshot.data?[Constants.sharedPreferencesEmailKey]}'),
//                   // Add other widgets to display additional user data
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   Future<Map<String, String>> _getUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? name = prefs.getString(Constants.sharedPreferencesNameKey);
//     String? email = prefs.getString(Constants.sharedPreferencesEmailKey);
//
//     return {
//       Constants.sharedPreferencesNameKey: name ?? 'N/A',
//       Constants.sharedPreferencesEmailKey: email ?? 'N/A',
//     };
//   }
//
//   Future<bool> _showLogoutConfirmationDialog(BuildContext context) async {
//     return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(Constants.logoutDialogTitle),
//           content: Text(Constants.logoutDialogMessage),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Close the dialog and go back to Login Page
//                 Get.offAll(LoginPage());
//               },
//               child: Text(Constants.yesButtonText),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Close the dialog and stay on Home Page
//                 Navigator.of(context).pop(false);
//               },
//               child: Text(Constants.noButtonText),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }




// home_page.dart



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: getUserInformation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No user information available'));
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('User Information:'),
                  Text('Email: ${snapshot.data!['email']}'),
                  Text('Password: ${snapshot.data!['password']}'),
                  ElevatedButton(
                    onPressed: () {
                      // Use Get.back() to navigate back to the previous screen (LoginPage)
                      Get.back();
                    },
                    child: Text('Go back to Login'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<Map<String, String>> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? 'N/A';
    String password = prefs.getString('password') ?? 'N/A';

    return {'email': email, 'password': password};
  }
}
