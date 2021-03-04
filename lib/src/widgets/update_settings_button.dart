import 'package:cafe_apps2go/src/resources/firestore.dart';
import 'package:cafe_apps2go/src/views/Home.dart';
import 'package:cafe_apps2go/src/widgets/combo_box.dart';
import 'package:cafe_apps2go/src/widgets/sugar_slider.dart';
import 'package:flutter/material.dart';

class UpdateSettingsButton extends StatefulWidget {
  final TextEditingController name;
  final ComboBox typeCoffee, typeSugar;
  final SugarSlider cantSugar;
  final GlobalKey<FormState> formKey;
  UpdateSettingsButton(
      this.formKey, this.name, this.typeCoffee, this.typeSugar, this.cantSugar);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateSettingsButton();
  }
}

class _UpdateSettingsButton extends State<UpdateSettingsButton> {
  FirestoreApi firestore = FirestoreApi();
  @override
  Widget build(BuildContext context) {
    final button = RaisedButton(
      onPressed: () {
        if (widget.formKey.currentState.validate()) {
          firestore.updateCoffeePrefference(widget.name.value.text, widget.typeSugar.getValue(),
              widget.typeCoffee.getValue(), widget.cantSugar.getValue());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (e) => new Home()));
        }
      },
      child: Text('Actualizar'),
    );

    return Container(margin: EdgeInsets.only(top: 10.0), child: button);
  }
}
