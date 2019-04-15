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
        body: Column(
            children: <Widget>[
          Text("할 일 추가",
              style: TextStyle(color: Colors.black87, fontSize: 42.0),
              textAlign: TextAlign.left),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              controller: eCtrl,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                labelText: "Todo Title",
                labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
                hintText: "Input Todo",
                contentPadding: const EdgeInsets.all(20.0),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 187, 189, 191), fontSize: 18),
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (text) {
                todoItems.add(text);
                eCtrl.clear();
                Navigator.pop(context);
              },
            ),
          )
        ]));
  }
}
