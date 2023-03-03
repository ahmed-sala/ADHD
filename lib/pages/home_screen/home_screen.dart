import 'package:flutter/material.dart';
import 'package:new_adhd/pages/home_screen/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            cards('What is ADHD ?', 0),
            cards('Signs and symptoms', 1),
            cards('Types', 2),
            cards('Causes', 3),
            cards('Treatment', 4),
            cards('Patient treatment', 5),
            cards('Complications', 6),
            cards('Prevention', 7),
          ],
        ),
      ),
    );
  }

  Widget cards(String title, int num) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(title: title, num: num)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            Icon(Icons.arrow_circle_right)
          ],
        ),
      ),
    );
  }
}
