import 'package:flutter/painting.dart';

class Todo {
  int id;
  String title;
  String note;
  String archiveTime;
  String endTime;
  Color color;


  Todo({this.title,this.note, this.color, this.endTime});


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': note,
      'color': color,
      'endTime': endTime,
    };
  }

  setId(int id){
    this.id = id;
  }

  setArchiveTime(String time) {
    this.archiveTime = time;
  }
}