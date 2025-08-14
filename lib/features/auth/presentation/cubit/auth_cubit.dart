import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> LoginUser({required String email, required password}) async {
    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errmassege: 'No user found for that email. '));
      } else if (e.code == 'wrong-password') {
        emit(
            LoginFailure(errmassege: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginFailure(errmassege: 'something went wrong'));
    }
  }

  Future<void> userRegister(
      String emailController, String passwordController) async {
    emit(RigesterLoading());
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      // ignore: unused_local_variable
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: emailController, password: passwordController);
      emit(RigesterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        RigesterFailure(errmassege: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        RigesterFailure(errmassege: 'Email already exists');
      }
    } catch (e) {
      RigesterFailure(errmassege: 'something went wrong');
    }
  }
}
