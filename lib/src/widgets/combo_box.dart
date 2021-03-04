import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  final List options;
  final String toChoose;
  ComboBox(this.options, this.toChoose, [this.value = null]);
  String value;

  getValue() {
    return value;
  }

  @override
  State<StatefulWidget> createState() => _ComboBox(options, toChoose);
}

class _ComboBox extends State<ComboBox> {
  List _options;
  String _toChoose;
  _ComboBox(this._options, this._toChoose);
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _current;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _current = _dropDownMenuItems[0].value;
    // widget.value = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String option in _options) {
        items.add(DropdownMenuItem(value: option, child: Text(option)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Selecciona el $_toChoose:"),
          DropdownButton(
            value:  widget.value != null ? widget.value : _current,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          )
        ],
      )),
    );
  }

  void changedDropDownItem(String selected) {
    setState(() {
      widget.value = selected;
    });
  }
}
