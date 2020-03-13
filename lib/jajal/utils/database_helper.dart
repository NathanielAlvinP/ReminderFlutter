import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:remember/models/task.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String taskTable = 'task_table';
  String colId = 'id';
  String colTask = 'task';
  String colDesc = 'desc'; 
  String colDate = 'date';

  DatabaseHelper._createInstance();

  factory DatabaseHelper(){

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{
    if(_database == null){
      _database = await intializeDatabase();
    }
    return _database;
  }

  Future<Database> intializeDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'task.db';

    var taskDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return taskDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $taskTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTask TEXT, $colDesc TEXT, $colDate TEXT) ');
  }
 
  //select task
 
  Future<List<Map<String, dynamic>>> getTaskMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
		var result = await db.query(taskTable, orderBy: '$colDate ASC');
		return result;
	}

  //insert task
  Future<int> insertTask(Task task) async{
    Database db = await this.database;
    var result = await db.insert(taskTable, task.toMap());
    return result;
  }

  //update task
  Future<int> updateTask(Task task) async{
    var db = await this.database;
    var result = await db.update(taskTable, task.toMap(), where: '$colId = ?', whereArgs: [task.id]);
    return result;
  }

  Future<int> deleteTask(int id) async{
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $taskTable WHERE $colId= $id');
    return result;
  }

  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $taskTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Task>> getTaskList() async {

		var taskMapList = await getTaskMapList(); // Get 'Map List' from database
		int count = taskMapList.length;         // Count the number of map entries in db table

		List<Task> taskList = List<Task>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			taskList.add(Task.fromMap(taskMapList[i]));
		}

		return taskList;
	}
}