import 'package:flutter/material.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:hive_flutter/adapters.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Refrence
  final _myBox = Hive.box("myBox");
  TodoDataBase db = TodoDataBase();
  final _controller = TextEditingController();

  @override
  void initState() {
    //if this is the first time ever opening the app then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createIntialData();
    } else {
      db.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = value;
    });
    db.updateData();
  }

  void savedNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: savedNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text("To Do "),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDolist.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDolist[index][0],
                onChanged: (value) => checkBoxChanged(value, index),
                taskCompleted: db.toDolist[index][1],
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
