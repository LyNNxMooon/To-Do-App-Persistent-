import 'package:flutter/material.dart';
import 'package:to_do_list/constant/colors.dart';
import 'package:to_do_list/constant/dimensions.dart';
import 'package:to_do_list/constant/strings.dart';
import 'package:to_do_list/widgets/save_button.dart';

// ignore: must_be_immutable
class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({super.key, required this.controller, required this.save});
  final TextEditingController controller;
  VoidCallback save;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kPrimaryColor,
      content: SizedBox(
        height: kDialogBoxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: kAddTaskText),
              controller: controller,
            ),
            SaveButton(
              buttonText: kAddTaskText,
              onPressed: save,
            )
          ],
        ),
      ),
    );
  }
}
