import 'package:clean_arch_flutter_training/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/errors/erros.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

class CredentialsParams {
  final String email;
  final String password;

  CredentialsParams({required this.email, required this.password});
}

abstract class ILoginUsecase {
  Future<Either<AuthExeption, LoggedUser>> call(
      CredentialsParams credentialsParams);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  @override
  Future<Either<AuthExeption, LoggedUser>> call(
      CredentialsParams credentialsParams) async {
    if (!isEmail(credentialsParams.email)) {
      return Left(AuthExeption('Error email'));
    }

    if (credentialsParams.password.isEmpty) {
      return Left(AuthExeption('Error password'));
    }

    return await authRepository.login(credentialsParams);
  }
}
