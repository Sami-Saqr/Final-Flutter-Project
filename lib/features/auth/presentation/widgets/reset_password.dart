import 'package:chat_app/Constants/constants.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            Colors.transparent,
          ),
        ),
        child: Text('forgotPassword',
            style: textStyle.copyWith(
              // color: kDescriptionTextColor,
              fontSize: 15,
            )),
      ),
    );
  }
}
