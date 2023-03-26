import 'package:flutter/material.dart';
import 'package:myth_games_case_study/tools/color_helper.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const AuthButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: ElevatedButton.styleFrom(
        elevation: 7,
        shadowColor: ColorHelper.buttonTitleColor,
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.9,
          MediaQuery.of(context).size.height * 0.075,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.zero,
        /*backgroundColor: */
      ),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: ColorHelper.backButtonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: ColorHelper.formBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
