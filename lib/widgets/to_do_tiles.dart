import 'package:flutter/material.dart';
import 'package:to_do_list/constant/colors.dart';
import 'package:to_do_list/constant/dimensions.dart';

// ignore: must_be_immutable
class ToDoTiles extends StatelessWidget {
  const ToDoTiles(
      {super.key, required this.taskName, required this.deleteFunction});

  final String taskName;
  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSP10x, horizontal: kSP20x),
      child: Container(
        padding: const EdgeInsets.all(kSP20x),
        decoration: const BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(kSP10x))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.checklist, color: kBlackColor),
                const SizedBox(
                  width: kSP20x,
                ),
                Text(
                  taskName,
                  style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: kFontSize18x,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  deleteFunction();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
