import 'package:flutter/material.dart';
import 'package:new_adhd/lists.dart';

class Activities extends StatefulWidget {
  @override
  State<Activities> createState() => _ActivitiesState();
}

List<bool> vis = [
  false,
  false,
  false,
  false,
  false,
  false,
];

class _ActivitiesState extends State<Activities> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          visibleParagraph('activity 1', 0),
          visibleParagraph('activity 2', 1),
          visibleParagraph('activity 3', 2),
          visibleParagraph('activity 4', 3),
          visibleParagraph('activity 5', 4),
          visibleParagraph('activity 6', 5),
        ],
      ),
    );
  }

  Widget visibleParagraph(String title, int num) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              vis[num] = !vis[num];
            });
          },
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Icon(
                  !vis[num]
                      ? Icons.arrow_circle_down_rounded
                      : Icons.arrow_circle_up_rounded,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        Visibility(
            visible: vis[num],
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                activity[num],
                style: TextStyle(fontSize: 20),
              ),
            )),
      ],
    );
  }
}
