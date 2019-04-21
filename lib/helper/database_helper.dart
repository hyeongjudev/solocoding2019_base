import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solocoding2019_base/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "todo.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      "CREATE TABLE Todo(id INTEGER PRIMARY KEY, title TEXT, note TEXT, archiveTime TEXT, endTime TEXT, color INTEGER)",
    );
  }

  Future<int> saveToDo(Todo todo) async {
    var dbClient = await db;
    int res = await dbClient.insert("Todo", todo.toMap());
    return res;
  }

  Future<List<Todo>> getToDoList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Todo');
    List<Todo> todoList = List();
    for (int i = 0; i < list.length; i++) {
      var todo = Todo(
          title: list[i]["title"],
          note: list[i]["note"],
          color: list[i]["color"],
          endTime: list[i]["endTime"],
          );
      todo.setId(list[i]["id"]);
      todo.setArchiveTime(list[i]["archiveTime"]);
      todoList.add(todo);
    }
    return todoList;
  }

  Future<int> deleteToDo(Todo todo) async {
    var dbClient = await db;

    int res =
        await dbClient.rawDelete('DELETE FROM Todo WHERE id = ?', [todo.id]);
    return res;
  }

  Future<bool> update(Todo todo) async {
    var dbClient = await db;
    int res = await dbClient.update("Todo", todo.toMap(),
        where: "id = ?", whereArgs: <int>[todo.id]);
    return res > 0 ? true : false;
  }
}
