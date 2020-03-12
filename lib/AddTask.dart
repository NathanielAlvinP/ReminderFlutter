import 'package:flutter/material.dart';
import 'package:remember/custom_button.dart';
import 'package:remember/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:remember/models/task.dart';

class AddTask extends StatefulWidget {
  final Task task;

  AddTask(this.task);
  @override
  _AddTaskState createState() => _AddTaskState(this.task);
}

class _AddTaskState extends State<AddTask> {
  Task task;
  
  _AddTaskState(this.task);

  TextEditingController selDate = TextEditingController();
  
  
  String selectedDate = 'Pick date';
  //String selectedTime = 'Pick time';
  
  Future pickDate() async {
    
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));
    if (datepick != null)
      setState(() {      
        selectedDate = DateFormat("dd-MM-yyyy").format(datepick).toString();
        selDate = tas;
      });
  }

  // Future pickTime() async {
  //   TimeOfDay timepick =
  //       await showTimePicker(context: context, initialTime: TimeOfDay.now());
  //   if (timepick != null) {
  //     setState(() {
  //       selectedTime = selectedTime;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add New Task")),
        backgroundColor: Colors.purple[100],
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
            CustomTextField(labelText: "Enter task name", controller: selDate,),
            SizedBox(
              height: 20.0,
            ),
            CustomTextField(labelText: "Description", controller: selDate,),
            SizedBox(
              height: 20.0,
            ),
            dateTimePicker(Icons.date_range, pickDate, selectedDate),
            SizedBox(
              height: 100.0,
            ),
            CustomButton(onPressed: (){}, buttonText: "Add Task", color: Colors.lightBlue,),
          ],
        ),
      ),
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
