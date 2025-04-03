import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyCollegePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.pinkAccent,
          ),
          Text('data'),
          Container(
            child: Text('Profile Summary',style:
              TextStyle(
               // font
              ),
            ),
          ),
        ],
      )
    );
  }
}
