import 'package:familyletter_prj/screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(children: <Widget>[
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
            '회원가입',
            style: TextStyle(fontSize: 55),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 100, bottom: 20, right: 150, left: 150),
            child: TextFormField(
              controller: _displayName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                hintText: 'write your Name',
                labelText: 'Name',
                prefixIcon: Icon(Icons.perm_identity),
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
            margin: EdgeInsets.only(top: 20, bottom: 20, right: 150, left: 150),
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
            margin: EdgeInsets.only(top: 20, bottom: 30, right: 150, left: 150),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                hintText: 'write your password',
                labelText: 'password',
                prefixIcon: Icon(Icons.lock_open),
              ),
              validator: (String val) {
                if (val.isEmpty) {
                  return "enter";
                }
                return null;
              },
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                _registerAcount();
              }
            },
            child: Text("Sign Up"),
          ),
        ]),
      ),
    );
  }

  void _registerAcount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;
    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _displayName.text);
      final user1 = _auth.currentUser;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return MyHomePage(
          user: user1,
        );
      }));
    }
  }
}
