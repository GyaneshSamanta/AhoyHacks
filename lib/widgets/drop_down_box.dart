import 'package:flutter/material.dart';

class DropdownBox extends StatefulWidget {
  const DropdownBox({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DropdownBox> createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String _dropdownValue = "Dash";
  List<String> dropDownOptions = [
    "Dash",
    "Sparky",
    "Snoo",
    "Clippy",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text('Source'),
          focusColor: Colors.amber,
          dropdownColor: Colors.transparent,
          items: dropDownOptions.map<DropdownMenuItem<String>>((String mascot) {
            return DropdownMenuItem<String>(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(mascot),
                ),
                value: mascot);
          }).toList(),
          value: _dropdownValue,
          iconEnabledColor: Color(0xff5663ff),
          onChanged: dropdownCallback,
          style: const TextStyle(
            color: Color(0xff5663ff),
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
