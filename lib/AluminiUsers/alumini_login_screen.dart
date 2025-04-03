import 'package:alumini_connect/AluminiUsers/AluminiScreens/alumini_screen.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/student_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/float_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AluminiLoginScreen extends StatefulWidget {
  // static const
  @override
  State<AluminiLoginScreen> createState() => _AluminiLoginScreen();
}

class _AluminiLoginScreen extends State<AluminiLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<bool> loginUserWithEmailAndPassword() async {
    try {
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      print(userCredentials);
      User? user = userCredentials.user;
      if(user!=null){
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
        if(userDoc.exists){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>StudentScreen()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User Does Not Found Please Sign Up'))
          );
        }
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.blue[500],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        child: Image.asset('images/kit_college_logo.png'),
                      ),
                    ),
                    Text(
                      'Login Here',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // Email & Password Fields
                    FloatingLabelTextField(
                      label: "Enter Your Email",
                      controller: emailController,
                    ),
                    SizedBox(height: 20),
                    FloatingLabelTextField(
                      label: "Enter Password",
                      isPassword: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 20.0),

                    // Submit Button
                    ElevatedButton(
                      onPressed: () async {
                        bool result = await loginUserWithEmailAndPassword();
                        if (result) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AluminiScreen()));
                        } else {
                          print('Wrong username or password');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
