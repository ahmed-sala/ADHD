import 'package:flutter/material.dart';
import 'package:new_adhd/lists.dart';

class DetailDoc extends StatelessWidget {
  final int num;
  DetailDoc({required this.num});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorTitle[num - 1]),
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              doctorDiscription[num - 1] == ''
                  ? Container()
                  : Text(
                      doctorDiscription[num - 1],
                      style: TextStyle(fontSize: 20),
                    ),
              SizedBox(
                height: 10,
              ),
              Text(
                'الرقم ${doctorPhone[num - 1]}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' ${doctorAddress[num - 1]}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
