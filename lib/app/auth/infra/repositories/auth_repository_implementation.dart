import 'package:clean_arch_flutter_training/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/errors/erros.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/usecases/login_usecase.dart';
import 'package:clean_arch_flutter_training/app/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImplementation(this.datasource);

  @override
  Future<Either<AuthExeption, LoggedUser>> login(
      CredentialsParams credentialsParams) async {
    try {
      final user = await datasource.login(credentialsParams);

      return Right(user);
    } on AuthExeption catch (e) {
      return Left(e);
    } on Exception {
      return Left(AuthExeption('Exeption Error'));
    }
  }
}
