import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/dialog_box.dart';
import 'package:todoapp/to_dotiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _mybox = Hive.box('mybox');

  final _controller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this 1st time opening then create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void deleteTask(index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void completed(index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void oncancel() {
    Navigator.of(context).pop();
  }

  void onsave() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          oncancel: oncancel,
          onsave: onsave,
          controller: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 15,
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.note_alt),
              Text(
                " To do App | Ventiator",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDotiles(
            taskcompleted: db.toDoList[index][1],
            onChange: (p0) {
              completed(index);
            },
            taskname: db.toDoList[index][0],
            isFirstTile: index == 0,
            deletetask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.amber,
        onPressed: () {
          createTask();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
