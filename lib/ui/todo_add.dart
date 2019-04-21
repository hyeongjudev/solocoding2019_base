import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';
import 'package:solocoding2019_base/helper/database_helper.dart';
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
  int _selectedIndex = 0;
  Color currentColor = const Color(0xFFF44336);

  void changeColor(Color color) => setState(() => currentColor = color);

  void changeCalendar(Calendar calendar, int index) {
    setState(() {
      _selectedCalendars = calendar;
      _selectedIndex = index;
    });
  }

  List<Todo> todoItems;
  List<Calendar> _calendars;
  Calendar _selectedCalendars;
  DeviceCalendarPlugin _deviceCalendarPlugin;

  _ToDoAddState(this.todoItems) {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }

  @override
  initState() {
    super.initState();
    _retrieveCalendars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _todoAdd(currentColor),
          child: Icon(Icons.check),
        ),
        appBar: AppBar(
          title: Text("Add ToDo"),
        ),
        body: Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 30.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
                          child: TextField(
                              controller: eTitleCtrl,
                              style: TextStyle(fontSize: 18.0),
                              decoration: InputDecoration(
                                labelText: "Todo Title",
                                labelStyle:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                                hintText: "Input Todo",
                                contentPadding: const EdgeInsets.all(20.0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 187, 189, 191),
                                    fontSize: 18),
                              ),
                              textInputAction: TextInputAction.done)),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 20.0),
                          child: TextField(
                              controller: eNoteCtrl,
                              style: TextStyle(fontSize: 18.0),
                              decoration: InputDecoration(
                                labelText: "Note",
                                labelStyle:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                                hintText: "Input Note",
                                contentPadding: const EdgeInsets.all(20.0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 187, 189, 191),
                                    fontSize: 18),
                              ),
                              textInputAction: TextInputAction.next)),
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
                                            child: Text('OK',
                                                style:
                                                    TextStyle(fontSize: 20.0)),
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
                              elevation: 3.0,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('달력 선택'),
                                      content: Container(
                                          width: double.maxFinite,
                                          height: 300.0,
                                          child: ListView.separated(
                                              separatorBuilder:
                                                  (context, int) => Divider(
                                                        color: Colors.indigo,
                                                      ),
                                              itemCount: _calendars.length,
                                              itemBuilder: (context, int) {
                                                return GestureDetector(
                                                    onTap: () {
                                                      changeCalendar(
                                                          _calendars[int], int);
                                                      Toast.show(
                                                          "Calendar : ${_calendars[int].name} 선택",
                                                          context,
                                                          duration:
                                                              Toast.LENGTH_LONG,
                                                          gravity:
                                                              Toast.BOTTOM);
                                                      print(
                                                          "_selectedCalendar : ${_selectedCalendars.name}");
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                _calendars[int]
                                                                    .name,
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        25.0,
                                                                    color: Colors
                                                                        .black87),
                                                              ),
                                                            ),
                                                            Icon(_calendars[int]
                                                                    .isReadOnly
                                                                ? Icons.lock
                                                                : Icons
                                                                    .lock_open)
                                                          ],
                                                        )));
                                              })),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text('OK',
                                                style:
                                                    TextStyle(fontSize: 20.0)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    );
                                  },
                                );
                              },
                              child: _selectedCalendars == null
                                  ? Text("달력 선택")
                                  : Text("${_selectedCalendars.name}"),
                              color: Colors.green,
                              textColor: Colors.white,
                            ),
                          ]),
                    ]))));
  }

  _todoAdd(Color pickerColor) {
    if (eTitleCtrl.text.trim() == "") {
      Toast.show("할 일을 입력 하세요", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      todoItems.add(Todo(
          title: eTitleCtrl.text,
          note: eNoteCtrl.text,
          color: pickerColor,
          endTime: null));
      eTitleCtrl.clear();
      eNoteCtrl.clear();
      Navigator.pop(context);
    }
  }

  Future addDatabase(Todo newTodo) async {
    var db = DatabaseHelper();
    await db.saveToDo(newTodo);
  }

  bool useWhiteForeground(Color color) {
    return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
  }

  _scheduleNotification() async {
    int notificationId = await ScheduledNotifications.scheduleNotification(
        new DateTime.now().add(new Duration(seconds: 5)).millisecondsSinceEpoch,
        "Ticker text",
        "Content title",
        "Content");
  }

  void _retrieveCalendars() async {
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          return;
        }
      }

      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
      setState(() {
        _calendars = calendarsResult?.data;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
