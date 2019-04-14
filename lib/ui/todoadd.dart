import 'package:flutter/material.dart';

class ToDoAddPage extends StatefulWidget {
  final List<String> todoList;
  ToDoAddPage(this.todoList);

  @override
  State<ToDoAddPage> createState() => _ToDoAddState(todoList);
}

class _ToDoAddState extends State<ToDoAddPage> {
  final TextEditingController eCtrl = TextEditingController();
  List<String> todoItems;
  _ToDoAddState(List<String> todoList) : todoItems = todoList;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add ToDo"),
      ),
        body: Stack(children: <Widget>[
      TextField(
        controller: eCtrl,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          hintText: "Input Todo",
          contentPadding: const EdgeInsets.all(20.0),
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 187, 189, 191), fontSize: 18),
        ),
        textInputAction: TextInputAction.done,
        onSubmitted: (text) {
          todoItems.add(text);
          eCtrl.clear();
          Navigator.pop(context);
        },
      )
    ]));
  }
}
