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
            new TextField(
              controller: eCtrl,
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
