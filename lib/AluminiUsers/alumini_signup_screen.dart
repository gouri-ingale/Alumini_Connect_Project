import 'package:alumini_connect/AluminiUsers/alumini_login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/float_button.dart';


class AluminiSignupScreen extends StatefulWidget {
  @override
  State<AluminiSignupScreen> createState() => _AluminiSignupScreenState();
}

class _AluminiSignupScreenState extends State<AluminiSignupScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final currentWorkingCompay = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    currentWorkingCompay.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      User? user = userCredentials.user;
      if (user != null) {
        DocumentReference userDoc = FirebaseFirestore.instance.collection("users").doc(user.uid);
        DocumentSnapshot snapshot = await userDoc.get();

        if(!snapshot.exists){
          await userDoc.set({
            'firstName': firstNameController.text.trim(),
            'lastName': lastNameController.text.trim(),
            'workingCompanyName'  : currentWorkingCompay.text.trim(),
            'email': emailController.text.trim(),
            'uid': user.uid,
            'role' : 'alumini',
            'createdAt': Timestamp.now()
          });
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Account Created Successfully'))
          );

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>AluminiLoginScreen()));
        }

      }
      print("User registered and data stored in firebase successfully...");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumini Connect"),
        backgroundColor: Colors.white70,
      ),
      resizeToAvoidBottomInset: true,
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
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[900],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: FloatingLabelTextField(
                            label: "First Name",
                            controller: firstNameController,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: FloatingLabelTextField(
                              label: "Last Name",
                              controller: lastNameController,
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    FloatingLabelTextField(
                      label: "Enter Your current working company Name",
                      controller: currentWorkingCompay,
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Already have an account ',
                              style: TextStyle(color: Colors.black87),
                            ),
                            TextSpan(
                              text: 'login here',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AluminiLoginScreen()));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await createUserWithEmailAndPassword();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AluminiLoginScreen()));
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