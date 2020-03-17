import 'package:flutter/material.dart';
//import 'package:reminder/AddTask.dart';
import 'package:reminder/AllTask.dart';
//import 'package:reminder/models/task.dart';
import 'package:reminder/tambahTask.dart';
import 'package:reminder/utils/dbmanager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Task task;
  @override
  Widget build(BuildContext context) {
    Task task;
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => AllTask(),
        '/addTask': (context) => MyHomePage(),
        //'/archive': (context) => MyArchive(),
      },
    );
  }
}

