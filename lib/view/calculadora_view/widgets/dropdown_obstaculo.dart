import 'package:flutter/material.dart';

import '../../../main.dart';

class DropdownObstaculo extends StatefulWidget {
  final Function(bool) onSaved;
  final bool initialValue;
  const DropdownObstaculo(
      {Key? key, required this.onSaved, this.initialValue = true})
      : super(key: key);

  @override
  State<DropdownObstaculo> createState() => _DropdownObstaculoState();
}

class _DropdownObstaculoState extends State<DropdownObstaculo> {
  String dropdownText = "Distancia Obstáculo-Receptora";
  @override
  void initState() {
    dropdownText =
        widget.initialValue ? dropdownText : 'Distancia Obstáculo-Transmissora';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Utilities.colorSecondary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: dropdownText,
        isExpanded: true,
        icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.arrow_downward)),
        style: const TextStyle(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        underline: Container(),
        onChanged: (String? newValue) {
          if (newValue != null) dropdownText = newValue;
          widget.onSaved(dropdownText == "Distancia Obstáculo-Receptora");
          setState(() {});
        },
        itemHeight: 56,
        items: <String>[
          'Distancia Obstáculo-Receptora',
          'Distancia Obstáculo-Transmissora'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
