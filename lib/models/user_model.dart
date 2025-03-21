// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  late String _nome;
  late String _email;
  late String _senha;
  UserModel();
  String get senha => _senha;
  set senha(String value) {
    _senha = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get nome => _nome;
  set nome(String value) {
    _nome = value;
  }
}
