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
     home: Home()
    );
  }
}
