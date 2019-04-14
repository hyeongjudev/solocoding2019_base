import 'package:flutter/material.dart';
import 'package:solocoding2019_base/ui/home.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatefulWidget {

  @override
  State createState() => new TodoDisplayList();
}

class  TodoDisplayList extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'solocoding2019', // application name
        theme: ThemeData(
        primarySwatch: Colors.green,
    ),
     home: Home(),
    );
     /* home : Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add), onPressed: null),
        appBar: AppBar(title: Text("Flutter Demo"),),
        body: Column(
          children: <Widget>[
            TextField(
              controller: eCtrl,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(hintText: "Input Todo", contentPadding : const EdgeInsets.all(20.0),hintStyle: TextStyle(color: Color.fromARGB(255, 187, 189, 191), fontSize: 18),),
              textInputAction: TextInputAction.done,
              onSubmitted: (text) {
                _todoItems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            Expanded(
                child: ListView.separated
                  (
                    separatorBuilder: (BuildContext ctxt, int Index) => Divider(
                      color: Colors.indigo,
                    ),
                    itemCount: _todoItems.length,
                    itemBuilder: (BuildContext ctxt, int Index) => Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(_todoItems[Index], style: TextStyle(fontSize: 23.0, color: Color.fromARGB(255, 255, 54, 0))),
                    )
                )
          )
          ],
        )
        )
    );*/
  }
}
