import 'package:flutter/material.dart';
import 'package:to_do_list/constant/colors.dart';

// ignore: must_be_immutable
class SaveButton extends StatelessWidget {
  SaveButton({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kSecondaryColor,
      child: Text(buttonText),
    );
  }
}
