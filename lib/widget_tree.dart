import 'package:flutter/material.dart';
import 'package:new_adhd/auth.dart';
import 'package:new_adhd/pages/home_page.dart';
import 'package:new_adhd/pages/login_register_page.dart';

class WidgetTree extends StatefulWidget {
  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
      stream: Auth().authStateChanges,
    );
  }
}
