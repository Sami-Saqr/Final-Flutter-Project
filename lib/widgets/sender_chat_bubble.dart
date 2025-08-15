import 'package:chat_app/models/masseges.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class SenderChatBubble extends StatelessWidget {
  const SenderChatBubble({
    super.key,
    required this.massege,
  });
  final Masseges massege;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: kDefultPadding * 1.5, horizontal: kDefultPadding),
        margin: EdgeInsets.all(kDefultPadding),
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
        child: Text(massege.massege),
      ),
    );
  }
}
