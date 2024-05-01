import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final bool isObsecure;

  const AuthField({
    super.key,
    required this.hintText,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: isObsecure,
    );
  }
}
