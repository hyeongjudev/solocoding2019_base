import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:solocoding2019_base/model/todo_model.dart';
import 'package:toast/toast.dart';

class ToDoAddPage extends StatefulWidget {
  final List<Todo> todoList;

  ToDoAddPage(this.todoList);

  @override
  State<ToDoAddPage> createState() => _ToDoAddState(todoList);
}

class _ToDoAddState extends State<ToDoAddPage> {
  final TextEditingController eTitleCtrl = TextEditingController();
  final TextEditingController eNoteCtrl = TextEditingController();

  Color currentColor = const Color(0xFFF44336);

  void changeColor(Color color) => setState(() => currentColor = color);

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
                        _todoAdd(currentColor);
                      },
                      padding: const EdgeInsets.all(5.0),
                    ),
                  ]),
              Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
                  child: TextField(
                      controller: eTitleCtrl,
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
              Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
                  child: TextField(
                      controller: eNoteCtrl,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        labelText: "Note",
                        labelStyle: TextStyle(fontSize: 18, color: Colors.blue),
                        hintText: "Input Note",
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
                      elevation: 3.0,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('색상 선택'),
                              content: SingleChildScrollView(
                                child: BlockPicker(
                                  pickerColor: currentColor,
                                  onColorChanged: changeColor,

                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text('OK',style: TextStyle(fontSize: 20.0)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('색상 선택'),
                      color: currentColor,
                      textColor: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
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
                  ]),
            ]));
  }

  _todoAdd(Color pickerColor) {
    if (eTitleCtrl.text.trim() == "") {
      Toast.show("할 일을 입력 하세요", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      todoItems.add(Todo(eTitleCtrl.text, eNoteCtrl.text, pickerColor, null));
      eTitleCtrl.clear();
      eNoteCtrl.clear();
      Navigator.pop(context);
    }
  }

  bool useWhiteForeground(Color color) {
    return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
  }
}
