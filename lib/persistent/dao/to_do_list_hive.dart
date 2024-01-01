import 'package:hive/hive.dart';
import 'package:to_do_list/persistent/hive_constant.dart';

class ToDoListDAO {
  ToDoListDAO._();
  static final ToDoListDAO _singleton = ToDoListDAO._();
  factory ToDoListDAO() => _singleton;

  Box<List> getListBox() => Hive.box<List>(kHiveListBox);

  void saveToDoList(List toDoList) {
    getListBox().put(kHiveListKey, toDoList);
  }

  List? get getToDoList => getListBox().get(kHiveListKey);
}
