import 'package:cafe_apps2go/src/models/CoffeeType.dart';
import 'package:cafe_apps2go/src/models/PrefferenceModel.dart';
import 'package:flutter/material.dart';

class Prefference extends StatelessWidget {
  final PrefferenceModel prefference;
  Prefference(this.prefference);

  @override
  Widget build(BuildContext context) {
    final String user = prefference.name;
    final String sugarType = prefference.typeSugar;
    final int sugar = prefference.cantSugar;
    final String coffeeType = prefference.typeCoffe;

    String imagePath = "images/" + coffeeType + '.PNG';

    final coffee = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Image(
        image: AssetImage(imagePath),
      ),
    );

    final prefferenceInfo = Container(
      margin: EdgeInsets.only(left: 15.0),
      child: Text(
        '$user\ncon $sugar de $sugarType',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );

    return Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: [coffee, prefferenceInfo],
        ));
  }
}
