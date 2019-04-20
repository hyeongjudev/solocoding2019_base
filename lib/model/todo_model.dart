import 'package:flutter/painting.dart';

class Todo {
  String title;
  String note;
  String archiveTime;
  DateTime endTime;
  Color color;


  Todo(this.title,this.note, this.color, this.endTime);
}