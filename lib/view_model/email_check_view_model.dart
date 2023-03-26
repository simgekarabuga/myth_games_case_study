import 'package:flutter/material.dart';

class EmailCheckViewModel with ChangeNotifier {
  void onBackPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onGetStartedPressed() {}
}
