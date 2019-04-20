import 'package:flutter/material.dart';
import 'package:solocoding2019_base/model/todo_model.dart';

class ToDoArchive extends StatefulWidget {
  final List<Todo> todoArchiveItems;

  ToDoArchive(this.todoArchiveItems);

  @override
  State<ToDoArchive> createState() => _ToDoArchiveState(todoArchiveItems);
}

class _ToDoArchiveState extends State<ToDoArchive> {
  List<Todo> todoItems;

  _ToDoArchiveState(this.todoItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Archive ToDo List"),
        ),
        body: Column(children: <Widget>[
          todoItems.isEmpty
              ? ListTile(
              title: Text("할 일 없음",
                  style: TextStyle(color: Colors.black87, fontSize: 42.0),
                  textAlign: TextAlign.left))
              : Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, int) =>
                      Divider(
                        color: Colors.indigo,
                      ),
                  itemCount: todoItems.length,
                  itemBuilder: (context, int) =>
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(todoItems[int].title,
                            style: TextStyle(
                                fontSize: 23.0,
                                color: Color.fromARGB(255, 255, 54, 0))),
                      )))
        ],
        ));
  }
}
