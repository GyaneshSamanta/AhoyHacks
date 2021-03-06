import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/travels.dart';

class DropdownBox extends StatefulWidget {
  DropdownBox({Key? key, required this.hintText}) : super(key: key);
  String hintText;

  @override
  State<DropdownBox> createState() => _DropdownBoxState();
}

class _DropdownBoxState extends State<DropdownBox> {
  String? _dropdownValue;
  List<String> dropDownOptions = [
    "Centaurea",
    "Oykot",
    "Reina de whiteland",
    "Reinade Deul",
    "Reina de Ballywood",
    "reino de briss",
    "Base da Alvida",
    "Illa da Cabra",
    "lvneel",
    "Rubeck",
    "Toroa",
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        widget.hintText == "Source"
            ? Provider.of<Travels>(context, listen: false)
                .updateSource(selectedValue)
            : Provider.of<Travels>(context, listen: false)
                .updateDestination(selectedValue);
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
            widget.hintText,
            style: const TextStyle(
                color: Color(0xFFFFDBAF), fontWeight: FontWeight.bold),
          ),
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
          iconEnabledColor: Color(0xffFFDBAF),
          onChanged: dropdownCallback,
          style: const TextStyle(
              color: Color(0xFFFFDBAF), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
