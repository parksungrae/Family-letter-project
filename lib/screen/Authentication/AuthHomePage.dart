import 'package:familyletter_prj/screen/Authentication/LoginPage.dart';
import 'package:familyletter_prj/screen/Authentication/RegisterPage.dart';
import 'package:flutter/material.dart';

class AuthHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 350)),
        Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Image.asset('images/가정통신문.png'),
        ),
        ButtonTheme(
          minWidth: 500.0,
          height: 100.0,
          buttonColor: Colors.grey[400],
          child: RaisedButton(
            onPressed: () {
              _push(context, Login());
            },
            child: Text("Sign in"),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ButtonTheme(
          minWidth: 500.0,
          height: 100.0,
          buttonColor: Colors.grey[400],
          child: RaisedButton(
            onPressed: () {
              _push(context, Register());
            },
            child: Text("Sign up"),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Image.asset('images/edu.png'),
        ),
      ],
    )));
  }

  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
