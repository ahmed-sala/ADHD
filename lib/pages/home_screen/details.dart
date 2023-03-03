import 'package:flutter/material.dart';
import 'package:new_adhd/lists.dart';

class Details extends StatelessWidget {
  final int num;
  final String title;
  Details({required this.title, required this.num});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              pragraphs[num],
              style: TextStyle(fontSize: 20, letterSpacing: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
