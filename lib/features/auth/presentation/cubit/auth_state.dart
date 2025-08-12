part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  String errmassege;
  LoginFailure({required this.errmassege});
}

class RigesterSuccess extends AuthState {}

class RigesterLoading extends AuthState {}

class RigesterFailure extends AuthState {
  String? errmassege;
  RigesterFailure({required this.errmassege});
}
