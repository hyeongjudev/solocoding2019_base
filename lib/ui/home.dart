import 'package:flutter/material.dart';
import 'package:solocoding2019_base/ui/todoadd.dart';

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
          /*  Text("할 일 리스트",
                style: TextStyle(color: Colors.black87, fontSize: 42.0),
                textAlign: TextAlign.left),*/
            Text("할 일 없음",
                style: TextStyle(color: Colors.black87, fontSize: 42.0),
                textAlign: TextAlign.left),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext ctxt, int Index) => Divider(
                          color: Colors.indigo,
                        ),
                    itemCount: todoItems.length,
                    itemBuilder: (BuildContext ctxt, int Index) => Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(todoItems[Index],
                              style: TextStyle(
                                  fontSize: 23.0,
                                  color: Color.fromARGB(255, 255, 54, 0))),
                        )))
          ],
        ));
  }

  _showTodoAdd() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoAddPage(todoItems)));
  }
}
