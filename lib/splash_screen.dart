import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/student_screen.dart';
import 'package:alumini_connect/AluminiUsers/AluminiScreens/alumini_screen.dart';
import 'package:alumini_connect/welcome_screen.dart';
import 'package:alumini_connect/StudentUsers/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 1)); // 🔹 Splash delay

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? role = await getUserRole(user.uid);
      if (role == "student") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => StudentScreen()));
      } else if (role == "alumni") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AluminiScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignupScreen()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
    }
  }

  Future<String?> getUserRole(String uid) async {
    DocumentSnapshot studentDoc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
    DocumentSnapshot alumniDoc = await FirebaseFirestore.instance.collection("alumni").doc(uid).get();

    if (studentDoc.exists) return "student";
    if (alumniDoc.exists) return "alumni";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/kit_college_logo.png', height: 150),
            SizedBox(height: 20),
            Text(
              "Welcome to Alumni Connect",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(color: Colors.white), // Only visible in Splash
          ],
        ),
      ),
    );
  }
}
