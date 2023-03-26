import 'package:flutter/material.dart';
import 'package:myth_games_case_study/tools/routes.dart';

class RegisterViewModel with ChangeNotifier {
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  void changePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void openEmailCheckPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.emailCheckPageKey);
  }
}
