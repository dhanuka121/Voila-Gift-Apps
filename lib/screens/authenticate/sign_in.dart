import 'package:VoilaGiftApp/appBars/signInAppBar.dart';
import 'package:VoilaGiftApp/colors.dart';

import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: SignInAppBar(title: "Sign in"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "to voila",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: PrimaryColor,
                child: Text("Sign In"),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text("Register"),
                color: PrimaryColor,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Continue Anonymously"),
                color: PrimaryColor,
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error Signin in");
                  } else {
                    print(result.uid);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
