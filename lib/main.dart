import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {

  @override
  State createState() => new TodoDisplayList();
}


class  TodoDisplayList extends State<MyApp>{
  List<String> _todoItems = [];
  final TextEditingController eCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'solocoding2019', // application name
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
      home : Scaffold(
        appBar: AppBar(title: Text("Flutter Demo"),),
        body: Column(
          children: <Widget>[
            TextField(
              controller: eCtrl,
              decoration: InputDecoration(hintText: "Input Todo", contentPadding : const EdgeInsets.all(20.0),hintStyle: TextStyle(color: Color.fromARGB(255, 187, 189, 191), fontSize: 18),),
              textInputAction: TextInputAction.done,
              onSubmitted: (text) {
                _todoItems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            Expanded(
                child: ListView.builder
                  (
                    itemCount: _todoItems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return Text(_todoItems[Index]);
                    }
                )
          )
          ],
        )
        )
    );
  }
}
