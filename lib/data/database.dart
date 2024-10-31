import 'package:hive_flutter/adapters.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // Run this method if this is the 1st time ever opening this app

  void createInitialData() {
    toDoList = [
      ['Do homeWork', true],
      ['Clean Room', false]
    ];
  }

  //Load data from database

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
