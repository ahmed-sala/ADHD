import 'package:flutter/material.dart';
import 'package:new_adhd/pages/advisors/detail_doc.dart';
import 'package:new_adhd/pages/advisors/doctor_card.dart';

class Advisors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 1)));
            },
            child: DoctorCard(
              num: 1,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 2)));
            },
            child: DoctorCard(
              num: 2,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 3)));
            },
            child: DoctorCard(
              num: 3,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 4)));
            },
            child: DoctorCard(
              num: 4,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 5)));
            },
            child: DoctorCard(
              num: 5,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailDoc(num: 6)));
            },
            child: DoctorCard(
              num: 6,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> doc = [];
}
