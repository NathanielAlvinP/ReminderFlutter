import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbTaskManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "remember.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(         
           "CREATE TABLE task(id INTEGER PRIMARY KEY autoincrement, task TEXT, desc TEXT, date TEXT)",
           
            );
      } );
    }
  }

  Future<int> insertTask(Task task) async {
    await openDb();
    return await _database.insert('task', task.toMap());
  }

  Future<List<Task>> getTaskList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('task');
    return List.generate(maps.length, (i) {
      return Task(
          id: maps[i]['id'], task: maps[i]['task'], desc: maps[i]['desc'], date: maps[i]['date']);
    });
  }

  Future<int> updateTask(Task task) async {
    await openDb();    
    return await _database.update('task', task.toMap(),
        where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> deleteTask(int id) async {
    await openDb();
    await _database.delete(
      'task',
        where: "id = ?", whereArgs: [id]
    );
  }
}

class Task {
  int id;
  String task;
  String desc;
  String date;
  Task({@required this.task, @required this.desc, @required this.date, this.id});
  Map<String, dynamic> toMap() {
    return {'task': task, 'desc': desc, 'date': date};
  }
}