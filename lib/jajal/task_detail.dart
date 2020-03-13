import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remember/custom_text_field.dart';
import 'package:remember/models/task.dart';
import 'package:remember/utils/database_helper.dart';
import 'package:remember/custom_button.dart';

class TaskDetail extends StatefulWidget {
  final Task task;

  TaskDetail(this.task);

  @override
  _TaskDetailState createState() => _TaskDetailState(this.task);
}

class _TaskDetailState extends State<TaskDetail> {
  DatabaseHelper helper = DatabaseHelper();
  String selectedDate = 'Pick date';
  Task task;
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  _TaskDetailState(this.task);

  Future pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));
    if (datepick != null)
      setState(() {
        selectedDate = DateFormat("dd-MM-yyyy").format(datepick).toString();
        updateDate();
      });
  }

  @override
  Widget build(BuildContext context) {
    taskController.text = task.task;
    descriptionController.text = task.desc;
    dateController.text = task.date;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Detail Task",
          style: TextStyle(color: Colors.purpleAccent),
        )),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Enter your task',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent))),
              onChanged: (value){
                updateTask();
              },        
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Description',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurpleAccent))),
              onChanged: (value){
                updateDesc();
              },        
            ),
            SizedBox(
              height: 20.0,
            ),
            dateTimePicker(Icons.date_range, pickDate, selectedDate),
            SizedBox(
              height: 100.0,
            ),
            CustomButton(
              onPressed: () {},
              buttonText: "Add Task",
              color: Colors.lightBlue,
            ),
          ],
        ),
      ),
    );
  }
  void updateTask(){
    task.task = taskController.text;
  }
  void updateDesc(){
    task.desc = taskController.text;
  }
  void updateDate(){
    task.date = selectedDate;
  }
  void _save() async{
    int result;
		if (task.id != null) {  // Case 1: Update operation
			result = await helper.updateTask(task);
		} else { // Case 2: Insert Operation
			result = await helper.insertTask(task);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Note Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Note');
		}
  }
  void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}
  FlatButton dateTimePicker(
      IconData icon, VoidCallback onPressed, String value) {
    return FlatButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(
              width: 25.0,
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
