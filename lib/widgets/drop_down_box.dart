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
      decoration: const BoxDecoration(
        color: Colors.black,
        // gradient: LinearGradient(colors: [
        //   Colors.white.withOpacity(0.2),
        //   Colors.white.withOpacity(0.05),
        // ]),
      ),
      child: DropdownButton(
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
        ),
      ),
    );
  }
}
