import 'package:flutter/material.dart';
//import 'package:reminder/AddTask.dart';
import 'package:riminder/AllTask.dart';
import 'package:riminder/Arsip.dart';
//import 'package:reminder/models/task.dart';
import 'package:riminder/tambahTask.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Task task;
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => AllTask(),
        '/addTask': (context) => MyHomePage(),
        '/archive': (context) => MyArchive(),
      },
    );
  }
}

