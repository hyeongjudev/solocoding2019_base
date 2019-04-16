import 'package:flutter/material.dart';
import 'package:solocoding2019_base/ui/todo_add.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeListState();
}

class _HomeListState extends State<Home> {
  List<String> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: _showTodoAdd),
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: Column(
          children: <Widget>[
            todoItems.isEmpty
                ? ListTile(
                    title: Text("할 일 없음",
                        style: TextStyle(color: Colors.black87, fontSize: 42.0),
                        textAlign: TextAlign.left))
                : Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, int) => Divider(
                              color: Colors.indigo,
                            ),
                        itemCount: todoItems.length,
                        itemBuilder: (context, int) => Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(todoItems[int],
                                  style: TextStyle(
                                      fontSize: 23.0, color: Colors.lightBlue)),
                            )))
          ],
        ));
  }

  _showTodoAdd() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ToDoAddPage(todoItems)));
  }
}
