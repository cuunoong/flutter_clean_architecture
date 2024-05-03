import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';

class UserSignup implements Usecase<User, UserSignupParams> {
  final AuthRepository authRepository;

  UserSignup(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignupParams params) {
    return authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
