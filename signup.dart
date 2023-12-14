// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'signup_controller.dart';
//
// class SignUp extends StatelessWidget {
//   final SignUpController _signupController = Get.put(SignUpController());
//   final _formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 180,
//                 child: Image.network(
//                   "https://cdn.pixabay.com/photo/2016/11/22/23/44/porsche-1851246_1280.jpg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//                 child: Form(
//                   key: _formkey,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 2.0, horizontal: 30.0),
//                         decoration: BoxDecoration(
//                             color: Color(0xFFedf0f8),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please Enter Name';
//                             }
//                             return null;
//                           },
//                           controller: TextEditingController()
//                             ..text = _signupController.name.value,
//                           onChanged: (value) => _signupController.name.value = value,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               icon: Icon(Icons.perm_identity),
//                               hintText: "Name",
//                               hintStyle: TextStyle(
//                                   color: Color(0xFFb2b7bf), fontSize: 18.0)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 2.0, horizontal: 30.0),
//                         decoration: BoxDecoration(
//                             color: Color(0xFFedf0f8),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please Enter Email';
//                             }
//                             return null;
//                           },
//                           controller: TextEditingController()
//                             ..text = _signupController.email.value,
//                           onChanged: (value) => _signupController.email.value = value,
//                           decoration: InputDecoration(
//                               icon: Icon(Icons.mail_outlined),
//                               border: InputBorder.none,
//                               hintText: "Email",
//                               hintStyle: TextStyle(
//                                   color: Color(0xFFb2b7bf), fontSize: 18.0)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 2.0, horizontal: 30.0),
//                         decoration: BoxDecoration(
//                             color: Color(0xFFedf0f8),
//                             borderRadius: BorderRadius.circular(30)),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please Enter Password';
//                             }
//                             return null;
//                           },
//                           controller: TextEditingController()
//                             ..text = _signupController.password.value,
//                           onChanged: (value) => _signupController.password.value = value,
//                           decoration: InputDecoration(
//                             icon: Icon(Icons.key),
//                             border: InputBorder.none,
//                             hintText: "Password",
//                             hintStyle: TextStyle(
//                               color: Color(0xFFb2b7bf),
//                               fontSize: 18.0,
//                             ),
//                             suffixIcon: GestureDetector(
//                               onTap: () {
//                                 _signupController.obscureText.value =
//                                 !_signupController.obscureText.value;
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Text(
//                                   _signupController.obscureText.value
//                                       ? "Show"
//                                       : "Hide",
//                                   style: TextStyle(
//                                     color: Color(0xFFb2b7bf),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           obscureText: _signupController.obscureText.value,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           if (_formkey.currentState!.validate()) {
//                             _signupController.registration();
//                           }
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.symmetric(
//                               vertical: 13.0, horizontal: 30.0),
//                           decoration: BoxDecoration(
//                               color: Color(0xFF273671),
//                               borderRadius: BorderRadius.circular(30)),
//                           child: Center(
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22.0,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Text(
//                         "or LogIn with",
//                         style: TextStyle(
//                           color: Color(0xFF273671),
//                           fontSize: 22.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Already have an account?",
//                             style: TextStyle(
//                               color: Color(0xFF8c8e98),
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5.0,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               //Get.toNamed('/Home');
//                               // Navigate to the Login page or perform other actions as needed
//                               Get.toNamed('/login'); // Example using GetX for navigation
//                             },
//                             child: Text(
//                               "LogIn",
//                               style: TextStyle(
//                                 color: Color(0xFF273671),
//                                 fontSize: 20.0,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// signup_page.dart
// signup_page.dart
// signup_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_project/home.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';
import 'constants.dart';



class SignupPage extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: signupController.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: signupController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              controller: signupController.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await signupController.signUp();
                if (!signupController.isLoading.value) {
                  // Navigate to home page after successful signup
                  Get.off(() => HomePage());
                }
              },
              child: Obx(() {
                return signupController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Sign Up');
              }),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.toNamed(Constants.loginRoute),
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
