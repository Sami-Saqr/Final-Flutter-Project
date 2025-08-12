import 'package:bloc/bloc.dart';
import 'package:chat_app/models/masseges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(LoginInitial());
  CollectionReference masseges =
      FirebaseFirestore.instance.collection('masseges');

  void sendMassege({required String massege, required String email}) {
    try {
      masseges.add(
          {'massege': massege, 'createdAt': DateTime.now(), 'email': email});
    } catch (e) {}
  }

  void getMassege() {
    masseges.orderBy('createdAt', descending: true).snapshots().listen(
      (event) {
        List<Masseges> massegesList = [];
        for (var doc in event.docs) {
          massegesList.add(Masseges.fromjson(doc));
        }
        emit(ChatSuccess(massegesList: massegesList));
      },
    );
  }
}
