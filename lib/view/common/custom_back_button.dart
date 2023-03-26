import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myth_games_case_study/tools/assets.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;

  const CustomBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            Assets.rectangleImage,
            width: MediaQuery.of(context).size.width * 0.28,
            fit: BoxFit.fitWidth,
            color: Colors.pink,
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Image.asset(
              Assets.rectangleImage,
              width: MediaQuery.of(context).size.width * 0.27,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          left: 8,
          child: GestureDetector(
            onTap: onPressed,
            child: Image.asset(
              Assets.backButtonImage,
              width: MediaQuery.of(context).size.width * 0.16,
            ),
          ),
        ),
      ],
    );
  }
}
