import 'package:flutter/material.dart';
import 'package:remember/AddTask.dart';
import 'package:remember/AllTask.dart';
import 'package:remember/models/task.dart';
import 'package:remember/tambahTask.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Task task;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => AllTask(),
        '/addTask': (context) => MyHomePage(),
      },
    );
  }
}

