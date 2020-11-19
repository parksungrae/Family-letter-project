import 'package:familyletter_prj/widget/Mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:familyletter_prj/screen/NoticePage.dart';
import 'package:familyletter_prj/screen/FamilyletterPage.dart';
import 'package:familyletter_prj/screen/SchedulePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  final User user;

  const MyHomePage({Key key, this.user}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 50,
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 50,
                          ),
                          onPressed: () {
                            _scaffoldkey.currentState.openEndDrawer();
                          }),
                    ],
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Image.asset('images/familyletter.png',
                          width: 120, height: 120),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return FamilyletterPage();
                        }));
                      },
                    ),
                  ]),
              SizedBox(
                height: 70,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Image.asset('images/notice.png',
                          width: 120, height: 120),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return NoticePage();
                        }));
                      },
                    ),
                    InkWell(
                      child: Image.asset('images/schedule.png',
                          width: 120, height: 120),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return SchedulePage();
                        }));
                      },
                    ),
                  ]),
            ],
          )
        ],
      ),
      endDrawer: MyDrawer(),
    );
  }
}
