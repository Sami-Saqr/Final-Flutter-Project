import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  const AlreadyHaveAnAccountCheck({super.key, required this.login, this.press});
  final bool login;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          // 'Don\'t have an account? ',
          login ? 'don\'t have an account? ' : 'already have an account? ',
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
        InkWell(
          //make inside able to click
          onTap: press,
          child: Text(
            // 'Sign Up',
            login ? 'Signup' : 'Login',
            style: const TextStyle(
              color: Color(0xffc7ede6),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
