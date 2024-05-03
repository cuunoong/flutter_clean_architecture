import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
