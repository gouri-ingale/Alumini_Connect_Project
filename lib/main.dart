import 'package:alumini_connect/StudentUsers/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:alumini_connect/splash_screen.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/student_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await Firebase.initializeApp();
  runApp(Alumini_Connect());
}

class Alumini_Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}


