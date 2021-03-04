import 'package:flutter/material.dart';

class SugarSlider extends StatefulWidget {
  double value = 0;
  SugarSlider([this.value]);
  int getValue() {
    return value.truncate();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SugarSlider();
  }
}

class _SugarSlider extends State<SugarSlider> {
  @override
  Widget build(BuildContext context) {
    final slider = Slider(
      onChanged: (value) {
        setState(() => widget.value = value);
      },
      value: widget.value,
      min: 0,
      max: 5,
      divisions: 5,
      label: widget.value.toString(),
    );
    // TODO: implement build
    return slider;
  }
}
