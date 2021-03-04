import 'package:cafe_apps2go/src/resources/auth.dart';
import 'package:cafe_apps2go/src/views/Register.dart';
import 'package:cafe_apps2go/src/views/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _App();
  }
}

class _App extends State<App> {
  Auth auth = Auth();
  String pageTitle = '';
  int indexTap = 0;
  User currentUser;

  void onPressedUserAction() {
    setState(() {
      indexTap == 0 ? indexTap = 1 : indexTap = 0;
    });
  }

  void onTapTapped(int index) {}
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsChildren = [SignIn(), Register()];
    pageTitle = indexTap == 0 ? 'Sign in' : 'Sign up';
    final titleApp = Row(
      children: [
        Text(
          '$pageTitle ',
          style: TextStyle(
              color: Colors.red.shade700,
              fontWeight: FontWeight.w900,
              fontSize: 16.0),
        ),
        Text(
          'Cafés de Apps2Go',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16.0),
        ),
      ],
    );

    final userAction = Row(
      children: [
        Container(child: Icon(Icons.person)),
        TextButton(
            onPressed: onPressedUserAction,
            child: Text(
              pageTitle == 'Sign in' ? 'Register' : 'Sign in',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            )),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: titleApp,
          actions: [userAction],
        ),
        body: ListView(children: [widgetsChildren[indexTap]]));
  }
}
