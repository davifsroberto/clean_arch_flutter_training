import 'package:clean_arch_flutter_training/app/auth/domain/repositories/auth_repository.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/usecases/login_usecase.dart';
import 'package:clean_arch_flutter_training/app/auth/external/firebase/firebase_auth_implementation.dart';
import 'package:clean_arch_flutter_training/app/auth/infra/datasources/auth_datasource.dart';
import 'package:clean_arch_flutter_training/app/auth/infra/repositories/auth_repository_implementation.dart';
import 'package:kiwi/kiwi.dart';

final container = KiwiContainer()
  ..registerFactory(
    (container) => LoginUsecase(container.resolve()),
  )
  ..registerFactory<AuthRepository>(
    (container) => AuthRepositoryImplementation(container.resolve()),
  )
  ..registerFactory<AuthDatasource>(
    (container) => FirebaseAuthImplementation(),
  );

main(List<String> args) {
  final usecase = container.resolve<LoginUsecase>;
}
