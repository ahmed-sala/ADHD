import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_adhd/auth.dart';
import 'package:new_adhd/pages/activities/activites.dart';
import 'package:new_adhd/pages/advisors/advisors.dart';
import 'package:new_adhd/pages/home_screen/home_screen.dart';
import 'package:new_adhd/pages/settings/settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('ADHD');
  }

  Widget _userId() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOut() {
    return ElevatedButton(onPressed: signOut, child: Text('sign out'));
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                signOut();
              },
              icon: Icon(Icons.logout_outlined))
        ],
        title: _title(),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.interests),
              label: 'Activities',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Advisors',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
              backgroundColor: Colors.black),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    HomeScreen(),
    Activities(),
    Advisors(),
    Settings(
      link:
          'https://www.mediafire.com/file/ko4wop979fdq7up/%25D9%2590ADHD.apk/file',
    )
  ];
}
// Container(
// height: double.infinity,
// width: double.infinity,
// padding: EdgeInsets.all(20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [_userId(), _signOut()],
// ),
// ),
