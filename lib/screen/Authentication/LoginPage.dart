import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:familyletter_prj/screen/HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(children: [withEmailPassword()]),
    );
  }

  Widget withEmailPassword() {
    return Form(
      key: _formkey,
      child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
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
                    flex: 6,
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                '로그인',
                style: TextStyle(fontSize: 55),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 30, right: 150, left: 150),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    hintText: 'write your e-mail',
                    labelText: 'ID',
                    prefixIcon: Icon(Icons.credit_card),
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "enter";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, right: 150, left: 150),
                child: Container(
                    child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    hintText: 'write your password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_open),
                  ),
                )),
              ),
              RaisedButton(
                onPressed: () {
                  _signinWithEmailPassword();
                },
                child: Text("Sign In"),
              ),
            ],
          )),
    );
  }

  void _signinWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyHomePage(
          user: user,
        );
      }));
    } catch (e) {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text("Failed"),
      ));
      print(e);
    }
  }
}
