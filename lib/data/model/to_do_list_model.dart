import 'package:to_do_list/persistent/dao/to_do_list_hive.dart';

class ToDoListModel {
  ToDoListModel._();
  static final ToDoListModel _singleton = ToDoListModel._();
  factory ToDoListModel() => _singleton;

  final ToDoListDAO _toDoListDAO = ToDoListDAO();

  void saveToDoList(List toDoList) {
    _toDoListDAO.saveToDoList(toDoList);
  }

  List get getToDoList => _toDoListDAO.getToDoList ?? [];
}
