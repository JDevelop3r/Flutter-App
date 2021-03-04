import 'package:cafe_apps2go/src/resources/firestore.dart';
import 'package:cafe_apps2go/src/widgets/combo_box.dart';
import 'package:cafe_apps2go/src/widgets/sugar_slider.dart';
import 'package:cafe_apps2go/src/widgets/update_settings_button.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Settings();
  }
}

class _Settings extends State<Settings> {
  List sugarOptions = ["Stevia", "Azúcar"];
  List coffeeOptions = ["Negrito", "Con Leche", "Tetero", "Marrón"];
  String nameField = '';
  String coffeeType;
  String sugarType;
  int cantSugar;
  TextEditingController nameController = TextEditingController(text: '');
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ComboBox sugarComboBox;
  ComboBox coffeeComboBox;
  SugarSlider sugarSlider;

  getData() async {
    FirestoreApi firestore = FirestoreApi();
    var data = await firestore.getOnePrefference();
    if ((data['name'] != null) | (data['name'] != '')) {
      setState(() {
        nameController = TextEditingController(text: data['name']);
      });
    }
    if ((data['typeCoffee'] != null)) {
      setState(() {
        coffeeType = data['typeCoffee'];
        coffeeComboBox = ComboBox(coffeeOptions, 'café', coffeeType);
      });
    }
    if ((data['typeSugar'] != null)) {
      setState(() {
        sugarType = data['typeSugar'];
        sugarComboBox = ComboBox(sugarOptions, 'azúcar', sugarType);
      });
    }
    if ((data['cantSugar'] != null)) {
      setState(() {
        cantSugar = data['cantSugar'];
        sugarSlider = SugarSlider(cantSugar.ceilToDouble());
      });
    }
  }

  @override
  void initState() {
    getData();
    sugarComboBox = ComboBox(sugarOptions, 'azúcar', sugarType);
    coffeeComboBox = ComboBox(coffeeOptions, 'café', coffeeType);
    sugarSlider = SugarSlider(0);
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      sugarType = sugarOptions[0];
      coffeeType = coffeeOptions[0];
      final title = Text(
        'Preferencias de Café',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      );

      final nameInput = Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: TextFormField(
            controller: nameController,
            onChanged: (value) {
              setState(() {
                nameField = value;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },));

      final sliderRow =
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Cucharadas\nde azúcar',
          textAlign: TextAlign.center,
        ),
        sugarSlider
      ]);

      final updateButton = UpdateSettingsButton(
          _formKey, nameController, coffeeComboBox, sugarComboBox, sugarSlider);
      final form = Form(
        key: _formKey,
        child: Column(
          children: [
            nameInput,
            Row(
              children: [sugarComboBox, coffeeComboBox],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            sliderRow,
            updateButton
          ],
        ),
      );
      return Container(
          padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
          child: Column(
            children: [title, form],
          ));
    }
  }
