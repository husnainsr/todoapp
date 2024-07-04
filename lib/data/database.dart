import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  //reference
  List toDolist = [];

  final _myBox = Hive.box("MyBox");

  //first time opening this app ever
  void createIntialData() {
    toDolist = [
      ["Make Tutorials", false],
      ["Do Excercise", false],
    ];
  }

  void loadData() {
    toDolist = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDolist);
  }
}
