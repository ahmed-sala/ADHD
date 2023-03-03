import 'package:flutter/material.dart';
import 'package:new_adhd/lists.dart';

class DoctorCard extends StatelessWidget {
  final int num;

  DoctorCard({required this.num});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/doc${num}.jpg',
          height: MediaQuery.of(context).size.height * .3,
          width: double.infinity,
        ),
        Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
            child: Text(doctorTitle[num - 1]))
      ],
    );
  }
}
