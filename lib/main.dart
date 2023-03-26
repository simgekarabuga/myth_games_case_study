import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myth_games_case_study/generated/l10n.dart';
import 'package:myth_games_case_study/tools/routes.dart';
import 'package:myth_games_case_study/view/register_page.dart';
import 'package:myth_games_case_study/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myth Games Case Study',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: ChangeNotifierProvider(
        create: (BuildContext context) => RegisterViewModel(),
        child: const RegisterPage(),
      ),
      routes: Routes.getRoutes(),
    );
  }
}
