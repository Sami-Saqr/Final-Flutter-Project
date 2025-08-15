import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/constants.dart';
import '../pages/cubit/chat_cubit/chat_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.masseges,
    required this.scrollController,
    this.email,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  final CollectionReference<Object?>? masseges;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: false,
        enabled: true,
        controller: controller,
        onSubmitted: (value) {
          context.read<ChatCubit>().sendMassege(massege: value, email: email!);
          controller.clear();
          scrollController.animateTo(
            0,
            duration: const Duration(microseconds: 800),
            curve: Curves.easeIn,
          );
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
          ),
          hintText: 'Type your message here',
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
            },
            icon: const Icon(Icons.send, color: kPrimaryColor),
          ),
        ));
  }
}
