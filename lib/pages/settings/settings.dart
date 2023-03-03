import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  final String link;

  const Settings({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: ListView(
        children: [
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          SizedBox(
            height: 40,
          ),
          Text(
            'Reach us ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.zero,
            child: SizedBox(
              width: size.width * .35,
              height: size.height * .35,
              child: Image.asset(
                'assets/images/qrCode.jpg',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),

          Center(
            child: GestureDetector(
              // width: size.width * .2,
              // height: 50,
              onTap: () async {
                if (await canLaunch(link)) {
                  await launch(link);
                } else {
                  throw 'Could not launch $link';
                }
              },
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .3, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text('Go to link')),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
