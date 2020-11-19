import 'package:familyletter_prj/widget/Mydrawer.dart';
import 'package:flutter/material.dart';

class FamilyletterPage extends StatelessWidget {
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
          '가정통신문',
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 1000,
          width: 600,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Colors.black12,
                  height: 80,
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        items[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ));
            },
          ),
        ),
      ]),
      endDrawer: MyDrawer(),
    );
  }
}
