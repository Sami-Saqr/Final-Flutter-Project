import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../models/masseges.dart';

class ReciverChatBubble extends StatelessWidget {
  const ReciverChatBubble({
    super.key,
    required this.massege,
  });
  final Masseges massege;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(kDefultPadding),
        margin: EdgeInsets.all(kDefultPadding),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        child: Text(massege.massege),
      ),
    );
  }
}
