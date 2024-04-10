import 'package:clean_arch_flutter_training/app/auth/domain/entities/logged_user.dart';
import 'package:clean_arch_flutter_training/app/auth/domain/usecases/login_usecase.dart';
import 'package:clean_arch_flutter_training/app/auth/infra/datasources/auth_datasource.dart';

class FirebaseAuthImplementation implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams credentialsParams) async {
    return LoggedUser(name: 'Davi Roberto', email: 'davirobertoemail@mail.com');
  }
}
