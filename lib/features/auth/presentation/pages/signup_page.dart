import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/commons/widgets/loader.dart';
import 'package:flutter_clean_architecture/core/utils/show_snackbar.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/widgets/auth_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackbar(context, state.message);
            }

            if (state is AuthSuccess) {
              showSnackbar(context, state.user.name);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthField(
                    controller: nameController,
                    hintText: 'Name',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthField(
                    controller: passwordController,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthButton(
                    text: "Sign Up",
                    onTap: () {
                      if (!formKey.currentState!.validate()) return;

                      // Save user data
                      context.read<AuthBloc>().add(
                            AuthSignup(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
