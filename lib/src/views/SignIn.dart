import 'package:cafe_apps2go/src/resources/auth.dart';
import 'package:cafe_apps2go/src/views/Home.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignIn();
  }
}

class _SignIn extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String emailFill = '';
  String passwordFill = '';
  String errorMessage = '';
  RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    final form = Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          margin: EdgeInsets.only(top: 140.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  emailFill = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!emailValidator.hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) {
                  passwordFill = value;
                },
                obscureText: true,
                style: TextStyle(),
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  } else if (value.length < 6) {
                    return 'Must be longer than 5 characters';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(children: [
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          new Auth()
                              .signIn(emailFill, passwordFill)
                              .then((res) => {
                                    if (res == 'user-not-found')
                                      {
                                        setState(() {
                                          errorMessage = 'User not found';
                                        })
                                      }
                                    else if (res == 'wrong-password')
                                      {
                                        setState(() {
                                          errorMessage = 'Wrong Password';
                                        })
                                      }
                                    else
                                      {
                                        setState(() {
                                          errorMessage = '';
                                        }),
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (e) => new Home()))
                                      }
                                  });
                        }
                      },
                      child: Text('   Sign In   '),
                    )
                  ])),
            ],
          ),
        ));
    // TODO: implement build
    return Center(
      child: Container(
        child: Column(
          children: [form],
        ),
      ),
    );
  }
}
