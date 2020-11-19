import 'package:familyletter_prj/screen/Authentication/AuthHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Setting'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          RaisedButton(
            onPressed: () async {
              _signOut().whenComplete(() => Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) {
                    return AuthHomePage();
                  })));
            },
            child: Text("Log Out"),
          ),
        ],
      ),
    );
  }

  Future _signOut() async {
    await _auth.signOut();
  }
}
