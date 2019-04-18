import 'package:flutter/material.dart';
import 'package:solocoding2019_base/model/todo_model.dart';
import 'package:toast/toast.dart';
class ToDoAddPage extends StatefulWidget {
  final List<Todo> todoList;

  ToDoAddPage(this.todoList);

  @override
  State<ToDoAddPage> createState() => _ToDoAddState(todoList);
}

class _ToDoAddState extends State<ToDoAddPage> {
  final TextEditingController eCtrl = TextEditingController();
  List<Todo> todoItems;

  _ToDoAddState(List<Todo> todoList) : todoItems = todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add ToDo"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("할 일 추가",
                        style: TextStyle(color: Colors.black87, fontSize: 42.0),
                        textAlign: TextAlign.left),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        _todoAdd();
                      },
                      padding: const EdgeInsets.all(5.0),
                    ),
                  ]),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
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
                            color: Color.fromARGB(255, 187, 189, 191),
                            fontSize: 18),
                      ),
                      textInputAction: TextInputAction.done)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.red,
                              Colors.green,
                              Colors.blue
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Text('기한 설정'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.red,
                              Colors.green,
                              Colors.blue
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: Text('미리 알림'),
                      ),
                    ),
                  ])
            ]));
  }

  _todoAdd() {
    if (eCtrl.text.trim() == "") {
      Toast.show("할 일을 입력 하세요", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      todoItems.add(Todo(eCtrl.text, null, null));
      eCtrl.clear();
      Navigator.pop(context);
    }
  }
}
