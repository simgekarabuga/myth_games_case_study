import 'package:flutter/material.dart';
import 'package:myth_games_case_study/tools/color_helper.dart';

class AuthTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final bool obscureText;

  const AuthTextField({
    Key? key,
    this.controller,
    this.inputType = TextInputType.text,
    this.validator,
    this.label,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        20,
      ),
    );
    InputBorder activeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFFB6F92),
      ),
      borderRadius: BorderRadius.circular(
        20,
      ),
    );
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorHelper.scaffoldBackgroundColor,
        border: border,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: border,
        focusedBorder: activeBorder,
        focusedErrorBorder: border,
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorHelper.buttonTitleColor,
        ),
      ),
      style: const TextStyle(
        color: ColorHelper.buttonTitleColor,
      ),
      validator: validator,
    );
  }
}
