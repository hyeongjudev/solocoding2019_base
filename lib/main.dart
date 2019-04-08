import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
List<String> litems = List();
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  List<String> todoListItems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // set material design app

    return MaterialApp(
      title: 'solocoding2019', // application name
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'), // app bar title
        ),
        body: new Column(
          children: <Widget>[
        new TextField(
        controller: eCtrl,
          onSubmitted: (text) {
            litems.add(text);
            eCtrl.clear();
            setState(() {});
          },
        )
        ]
       )
      ),
    );
  }

  Widget buildBody(BuildContext ctxt, int index) {
    return Text(litems[index]);
  }
}
