import 'package:flutter/material.dart';
import 'package:to_do_list/constant/colors.dart';
import 'package:to_do_list/constant/dimensions.dart';
import 'package:to_do_list/constant/strings.dart';
import 'package:to_do_list/data/model/to_do_list_model.dart';
import 'package:to_do_list/widgets/add_new_task_dialog_box.dart';
import 'package:to_do_list/widgets/to_do_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List toDoList = [];
  final ToDoListModel _toDoListModel = ToDoListModel();

  @override
  void initState() {
    toDoList = _toDoListModel.getToDoList;
    super.initState();
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (_) => AddTaskDialog(controller: _controller, save: addNewTask),
    );
  }

  void addNewTask() {
    setState(() {
      toDoList.add(_controller.text);
      _toDoListModel.saveToDoList(toDoList);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      _toDoListModel.saveToDoList(toDoList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              kTitleText,
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: kSP30x,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                  onPressed: () {
                    openDialog();
                  },
                  child: const Row(
                    children: [
                      Text(
                        kAddText,
                        style: TextStyle(
                            color: kBlackColor, fontSize: kFontSize18x),
                      ),
                      Icon(
                        Icons.add,
                        size: kAddIconSize,
                        color: kBlackColor,
                      )
                    ],
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: kSP25x),
            child: ListView.builder(
              itemBuilder: (context, index) => ToDoTiles(
                taskName: toDoList[index],
                deleteFunction: () {
                  deleteTask(index);
                },
              ),
              itemCount: toDoList.length,
            ),
          )),
    );
  }
}
