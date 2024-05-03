import 'package:flutter_clean_architecture/core/secrets/app_secrets.dart';
import 'package:flutter_clean_architecture/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_architecture/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/features/auth/domain/usecase/user_signup.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);

  _initAuth();
}

void _initAuth() {
  serviceLocator

    // Datasource
    ..registerFactory<AuthRemoteDatasource>(
        () => AuthRemoteDatasourceImpl(serviceLocator()))

    // Repository
    ..registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()))

    // Usecase
    ..registerFactory(() => UserSignup(serviceLocator()))

    // Bloc
    ..registerFactory(() => AuthBloc(userSignup: serviceLocator()));
}
