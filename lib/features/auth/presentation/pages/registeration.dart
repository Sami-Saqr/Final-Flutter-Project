import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../Constants/constants.dart';
import '../../../../helpers/show_snake_bar.dart';
import '../widgets/already_have_an_account_check.dart';
import '../widgets/custom_password_field.dart';
import '../widgets/custom_rounded_button.dart';
import '../widgets/custom_text_field.dart';

class Registeration extends StatelessWidget {
  Registeration({super.key});
  static String id = 'Registeration';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RigesterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully Registered'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushNamed(context, LogIn.id);
        } else if (state is RigesterFailure) {
          ShowSnackBar(
            context,
            'Registration failed. Please try again.',
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state is RigesterLoading;

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(kDefultPadding),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    Image.asset(kLogo),
                    Text(
                      'Chat Chat',
                      style: textStyle,
                    ),
                    const Spacer(flex: 1),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Register',
                        style: textStyle.copyWith(fontSize: 24),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      hintText: 'Enter Your Email',
                      labelText: 'Email',
                      controller: emailController,
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
                      buttonName: 'Register',
                      color: Colors.white70,
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).userRegister(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.pushNamed(context, LogIn.id);
                      },
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
