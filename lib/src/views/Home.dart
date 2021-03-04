import 'package:cafe_apps2go/src/app.dart';
import 'package:cafe_apps2go/src/resources/auth.dart';
import 'package:cafe_apps2go/src/views/Settings.dart';
import 'package:cafe_apps2go/src/widgets/prefference_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  int indexTap = 0;
  Auth auth = new Auth();
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsChildren = [PrefferenceList(), Settings()];

    final titleApp = Row(
      children: [
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
            onPressed: () {
              auth.signOut();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (e) => new App()));
            },
            child: Text(
              'LogOut',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            )),
      ],
    );

    final settings = Row(
      children: [
        Container(child: Icon(Icons.settings)),
        TextButton(
          onPressed: () {
            setState(() {
              indexTap = 1;
            });
          },
          child: Text("Settings",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        ),
      ],
    );

    final listPrefference = Row(
      children: [
        Container(child: Icon(Icons.list)),
        TextButton(
          onPressed: () {
            setState(() {
              indexTap = 0;
            });
          },
          child: Text("List",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
        ),
      ],
    );

    final actionsToShow = [indexTap == 0 ? settings : listPrefference];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: titleApp,
          actions: [userAction, ...actionsToShow],
        ),
        body: ListView(children: [widgetsChildren[indexTap]]));
  }
}
