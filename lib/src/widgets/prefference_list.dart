import 'package:cafe_apps2go/src/resources/firestore.dart';
import 'package:cafe_apps2go/src/widgets/prefference.dart';
import 'package:flutter/material.dart';

class PrefferenceList extends StatefulWidget {
  @override
  _PrefferenceListState createState() => _PrefferenceListState();
}

class _PrefferenceListState extends State<PrefferenceList> {
  final FirestoreApi firestore = new FirestoreApi();
  bool loading = true;
  List<Widget> list = [];
  void getList() async {
    List<Prefference> res = await firestore.getCoffeePrefferences();
    setState(() {
      list = res;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getList();
    loading = true;
  }
  @override
  Widget build(BuildContext context) {
    return loading
        ? Container()
        : Container(
        margin: EdgeInsets.only(top: 15.0),
        height: 510,
        child: ListView(
          children: list,
        ));
  }
}