import 'package:cafe_apps2go/src/resources/auth.dart';
import 'package:cafe_apps2go/src/views/Home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Register();
  }
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String emailFill;
  String passwordFill;
  String errorMessage = '';
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
                    return 'Please enter some text';
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
                  }
                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(children: [
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          new Auth()
                              .signUp(emailFill, passwordFill)
                              .then((res) => {
                                    if (res == 'email-already-in-use')
                                      {
                                        setState(() {
                                          errorMessage =
                                              'That account already exist';
                                        })
                                      }
                                    else
                                      {
                                        setState(() {
                                          errorMessage = '';
                                        }),
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (e) => Home()))
                                      }
                                  });
                        }
                      },
                      child: Text('   Register   '),
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
