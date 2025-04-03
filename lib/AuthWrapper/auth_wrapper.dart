import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alumini_connect/welcome_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator())); // Only when opening the app
        }
        if (snapshot.hasData) {
          return Container(); // 🔹 Won't be used because SplashScreen handles redirection
        }
        return WelcomeScreen();
      },
    );
  }
}
