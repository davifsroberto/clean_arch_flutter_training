import 'package:clean_arch_flutter_training/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/errors/erros.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  final repository = AuthRepositoryMock();
  final usecase = LoginUsecase(repository);
  final credentialsParams = CredentialsParams(
    email: 'fake_email@fake.com',
    password: 'fake_password',
  );

  test('shold call login', () async {
    when(() => repository.login(credentialsParams))
        .thenAnswer((_) async => Right(LoggedUser(
              email: credentialsParams.email,
              name: 'Davi Roberto',
            )));

    final result = await usecase.call(credentialsParams);

    expect(result.isRight(), true);
    expect(
        result
            .getOrElse(() => LoggedUser(
                  name: '',
                  email: '',
                ))
            .name,
        'Davi Roberto');
  });

  test('shold throw an exception when password is invalid', () async {
    final result = await usecase.call(CredentialsParams(
      email: 'fake_email@fake.com',
      password: '',
    ));

    expect(result.isLeft(), true);
  });

  test('shold throw an exception when the repository throws', () async {
    when(() => repository.login(credentialsParams))
        .thenAnswer((_) async => Left(AuthExeption('d')));

    final result = await usecase(credentialsParams);

    expect(result.isLeft(), true);
  });
}
