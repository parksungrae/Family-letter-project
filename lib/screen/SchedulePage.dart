import 'package:familyletter_prj/widget/Mydrawer.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  final items = [
    'a',
    'b',
    'c',
    'a',
    'b',
    'c',
    'a',
    'b',
    'c',
    'a',
    'b',
    'c',
  ];
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 50)),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_return,
                    color: Colors.black,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 50,
                  ),
                  onPressed: () {
                    _scaffoldkey.currentState.openEndDrawer();
                  }),
            ),
          ],
        ),
        Text(
          '학사일정표',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 50,
        ),
      ]),
      endDrawer: MyDrawer(),
    );
  }
}
