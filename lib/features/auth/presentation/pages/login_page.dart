import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/pages/cubit/chat_cubit/chat_cubit.dart' as chat_cubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../Constants/constants.dart';
import '../../../../helpers/show_snake_bar.dart';
import '../../../../pages/chat_page.dart';
import '../widgets/already_have_an_account_check.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/custom_text_field.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  static const String id = 'LogIn';

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          BlocProvider.of<chat_cubit.ChatCubit>(context).getMassege();
          Navigator.pushNamedAndRemoveUntil(
            context,
            ChatPage.id,
            (route) => true,
          );
        } else if (state is LoginFailure) {
          // عرض رسالة خطأ للمستخدم
          ShowSnackBar(
            context,
            'Incorrect email or password. Please try again.',
          );
        }
      },
      builder: (context, state) {
        // تحديد حالة التحميل
        bool isLoading = state is LoginLoading;

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: EdgeInsets.all(kDefultPadding),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Image.asset(kLogo),
                  Text(
                    'Chat chat',
                    style: textStyle,
                  ),
                  const Spacer(flex: 1),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'LogIn',
                      style: textStyle.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    controller: usernameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPasswordField(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomRoundedButton(
                    buttonName: 'LogIn',
                    color: Colors.white70,
                    press: () async {
                      await BlocProvider.of<AuthCubit>(context).LoginUser(
                        email: usernameController.text,
                        password: passwordController.text,
                      );
                    },
                    textColor: Colors.grey.shade800,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AlreadyHaveAnAccountCheck(
                    login: true,
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
