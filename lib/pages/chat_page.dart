import 'package:chat_app/models/masseges.dart';
import 'package:chat_app/widgets/reciver_chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Constants/constants.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/sender_chat_bubble.dart';
import 'cubit/chat_cubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static const String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    String? email = FirebaseAuth.instance.currentUser!.email;
    final scrollController = ScrollController();
    TextEditingController controller = TextEditingController();
    List<Masseges> massegesList = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, height: 40),
            Text('Chat'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefultPadding),
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatSuccess) {
                    massegesList = state.massegesList;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: massegesList.length,
                      itemBuilder: (context, index) {
                        return email == massegesList[index].email
                            ? SenderChatBubble(
                                massege: massegesList[index],
                              )
                            : ReciverChatBubble(
                                massege: massegesList[index],
                              );
                      });
                },
              ),
            ),
            CustomTextField(
              controller: controller,
              scrollController: scrollController,
              email: email,
            )
          ],
        ),
      ),
    );
  }
}
