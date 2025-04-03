import 'package:alumini_connect/AluminiUsers/alumini_signup_screen.dart';
import 'package:alumini_connect/StudentUsers/signup_screen.dart';
import 'package:flutter/material.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/kit_college_logo.png',height: 150,),
            SizedBox(height: 20.0,),
            Text('Welcome To Alumini Connect',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),),
            SizedBox(height: 40.0,),
            ElevatedButton(
              onPressed: ()  {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              ),
              child: Text(
                'Login as Student',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: ()  {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AluminiSignupScreen()),
               );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              ),
              child: Text(
                'Login as Alumini',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
