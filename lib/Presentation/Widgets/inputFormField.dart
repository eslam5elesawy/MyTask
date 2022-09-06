import 'package:flutter/material.dart';

class CommonInputFormField extends StatelessWidget {

  final String labelText;
  final TextEditingController controller;
  final bool isReadOnly;
  final TextInputType textInputType;
  final Function() function;

  const CommonInputFormField(
      {Key? key,
        required this.labelText,
        required this.controller,
        this.isReadOnly = false,
        required this.function,
        this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal)),
        validator: (String? value) {
          if (value!.isEmpty) {
            return '$labelText Must Not Be Empty';
          } else {
            return null;
          }
        },
        readOnly: isReadOnly,
        onTap: function
    );
  }
}
