import 'package:flutter/material.dart';
import 'package:alumini_connect/constants/Constants.dart';
class FloatingLabelTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  FloatingLabelTextField({required this.label, this.isPassword = false,this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label, // Floating label text
        floatingLabelBehavior: FloatingLabelBehavior.auto, // Moves up on focus
        border: kborder ,
        focusedBorder: kfocusedBorder ,
        labelStyle: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontWeight: FontWeight.w400,
          fontSize: 16, // Adjust label size
          color: Colors.grey,
        ),
      ),
    );
  }
}