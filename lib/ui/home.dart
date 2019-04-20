import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:solocoding2019_base/model/todo_model.dart';
import 'package:solocoding2019_base/ui/todo_add.dart';

import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeListState();
}

class _HomeListState extends State<Home> {
  List<Todo> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: AnimatedFloatingActionButton(
            fabButtons: <Widget>[
              floatAdd(), floatArchive()
            ],
            colorStartAnimation: Colors.blue,
            colorEndAnimation: Colors.red,
            animatedIconData: AnimatedIcons.menu_close //To principal button
        ),
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: Column(
          children: <Widget>[
            todoItems.isEmpty
                ? ListTile(
                    title: Text("할 일 없음",
                        style: TextStyle(color: Colors.black87, fontSize: 42.0),
                        textAlign: TextAlign.left))
                : Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, int) => Divider(
                            color: Colors.indigo,
                          ),
                      itemCount: todoItems.length,
                      itemBuilder: (context, int) {
                        return Slidable(
                          delegate: SlidableDrawerDelegate(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: todoItems[int].color,
                                child: Text((int+1).toString()),
                                foregroundColor: Colors.white,
                              ),
                              title: Text(todoItems[int].title, style: TextStyle(fontSize: 25.0, color: todoItems[int].color),),
                              subtitle: Text(todoItems[int].note, style: TextStyle(fontSize: 16.0)),
                            ),
                          ),
                          actions: <Widget>[
                            IconSlideAction(
                              caption: 'Archive',
                              color: Colors.blue,
                              icon: Icons.archive,
                              onTap: () => _showSnackBar(context,'Archive'),
                            ),
                            IconSlideAction(
                              caption: 'Share',
                              color: Colors.indigo,
                              icon: Icons.share,
                              onTap: () => _showSnackBar(context, 'Share'),
                            ),
                          ],
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                setState(() {
                                  todoItems.removeAt(int);
                                });
                                _showSnackBar(context, 'Delete');
                                },
                            ),
                          ],
                        );
                      },
                    ),
                  )
          ],
        ));
  }


  Widget floatAdd() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () =>_showTodoAdd(),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
  Widget floatArchive() {
    return Container(
      child: FloatingActionButton(
        heroTag: "btn2",
        onPressed: null,
        tooltip: 'Archive',
        child: Icon(Icons.archive),
      ),
    );
  }
  _showTodoAdd() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ToDoAddPage(todoItems)));
  }

  _showSnackBar(BuildContext context, String action) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(action)));
  }
}
