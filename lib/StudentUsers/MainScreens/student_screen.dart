import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/pages/HomePage.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/pages/SearchPage.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/pages/ChatPage.dart';
import 'package:alumini_connect/StudentUsers/MainScreens/pages/MyCollegePage.dart';

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int index = 0; // Tracks the selected page index

  final screens = [
    HomePage(),
    SearchPage(),
    ChatPage(),
    MyCollegePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.lightBlue[700],
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.lightBlue[100],
          body: screens[index], // Displays the selected page
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.lightBlue.shade500,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.lightBlue.shade700,
            items: [
              Icon(Icons.home, size: 30),
              Icon(Icons.search, size: 30),
              Icon(Icons.chat_outlined, size: 30),
              Icon(Icons.school_outlined, size: 30),
            ],
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 200),
            height: 60,
            index: index,
            onTap: (newIndex) {
              setState(() {
                index = newIndex;
              });
            },
          ),
        ),
      ),
    );
  }
}
