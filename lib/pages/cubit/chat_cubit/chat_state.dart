part of 'chat_cubit.dart';

abstract class ChatState {
  const ChatState();
}

class LoginInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<Masseges> massegesList = [];
  ChatSuccess({required this.massegesList});
}

class LoginLoading extends ChatState {}

class LoginFailure extends ChatState {
  String errmassege;
  LoginFailure({required this.errmassege});
}
