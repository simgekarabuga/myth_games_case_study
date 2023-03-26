import 'package:flutter/material.dart';
import 'package:myth_games_case_study/view/email_check_page.dart';
import 'package:myth_games_case_study/view/register_page.dart';
import 'package:myth_games_case_study/view_model/email_check_view_model.dart';
import 'package:myth_games_case_study/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String registerPageKey = '/register_page';
  static const String emailCheckPageKey = '/email_check_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      registerPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => RegisterViewModel(),
            child: const RegisterPage(),
          ),
      emailCheckPageKey: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => EmailCheckViewModel(),
            child: const EmailCheckPage(),
          ),
    };
  }
}
