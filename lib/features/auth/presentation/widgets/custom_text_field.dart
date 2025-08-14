import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller});
  final String hintText;
  final String labelText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
        label: Text(
          labelText,
          style: textStyle.copyWith(fontSize: 15),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
