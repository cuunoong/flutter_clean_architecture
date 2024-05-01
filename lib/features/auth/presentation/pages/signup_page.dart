import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/widgets/auth_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 24,
          ),
          AuthField(
            hintText: 'Name',
          ),
          SizedBox(
            height: 12,
          ),
          AuthField(
            hintText: 'Email',
          ),
          SizedBox(
            height: 12,
          ),
          AuthField(
            hintText: "Password",
            isObsecure: true,
          ),
          SizedBox(
            height: 24,
          ),
          AuthButton(
            text: "Sign Up",
          )
        ]),
      ),
    );
  }
}
