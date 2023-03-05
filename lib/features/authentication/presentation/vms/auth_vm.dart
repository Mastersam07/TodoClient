import 'package:flutter/material.dart';
import 'package:todo/features/todo/presentation/view/todo_home.dart';

class AuthenticationViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';

  bool isSignIn = false;
  bool obscurePassword = false;

  String get emailValue => _email;

  String get passwordValue => _password;

  void emailOnChanged(String value) {
    _email = value;
    notifyListeners();
  }

  void passwordOnChanged(String value) {
    _password = value;
    notifyListeners();
  }

  void obscurePasswordOnTap() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void signUpOnTap(BuildContext context) {
    Navigator.of(context).pushNamed(TodoHome.route);
  }

  void signInOnTap(BuildContext context) {
    Navigator.of(context).pushNamed(TodoHome.route);
  }

  void signInOptionOnTap() {
    isSignIn = !isSignIn;
    _email = '';
    _password = '';
    obscurePassword = false;
    notifyListeners();
  }
}
