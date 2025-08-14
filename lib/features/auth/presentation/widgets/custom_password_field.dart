import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';

// ignore: must_be_immutable
class CustomPasswordField extends StatelessWidget {
  CustomPasswordField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller});
  final String hintText;
  final String labelText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
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
        fillColor: Colors.white,
      ),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
    );
  }
}
