import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_adhd/auth.dart';
import 'package:new_adhd/widget_tree.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool securedPassword = true;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String? errorMessage = '';
  bool isLogin = true;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('ADHD');
  }

  // Widget _entryField(String title, TextEditingController controller) {
  //   return TextField(
  //     controller: controller,
  //     decoration: InputDecoration(
  //       labelText: title,
  //     ),
  //   );
  // }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ?$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Register'));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register instead' : 'Login instead'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'please enter email';
                }
                if (!ValidationUtils.isValidEmail(text)) {
                  return 'please enter valid email';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'please enter password';
                }
                if (text.length < 7) {
                  return 'please enter password more than 6 character';
                }
                return null;
              },
              obscureText: securedPassword,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        securedPassword = !securedPassword;
                      });
                    },
                    child: securedPassword
                        ? Icon(Icons.visibility_outlined)
                        : Icon(Icons.visibility_off_outlined)),
                labelText: 'Passowrd',
              ),
            ),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: MaterialButton(
                onPressed: () {
                  signupGoogle().then((user) {
                    log('\n user:${user?.user ?? ''}');
                    log('\n user additional info :${user?.additionalUserInfo}');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => WidgetTree()));
                  });
                },
                color: Colors.blueAccent,
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/googleImg.png'),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Sign In with Google")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ValidationUtils {
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}

final FirebaseAuth authe = FirebaseAuth.instance;

Future<UserCredential?> signupGoogle() async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if (googleUser != null) {
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final Credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    return await FirebaseAuth.instance.signInWithCredential(Credential);
    // for go to the HomePage screen
  }
}
