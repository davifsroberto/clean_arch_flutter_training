import 'package:clean_arch_flutter_training/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/errors/erros.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AuthExeption, LoggedUser>> login(
      CredentialsParams credentialsParams);
}
