import 'package:flutter/material.dart';
import 'package:remember/AddTask.dart';
import 'package:remember/AllTask.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => AllTask(),
        '/addTask': (context) => AddTask(),
      },
    );
  }
}

