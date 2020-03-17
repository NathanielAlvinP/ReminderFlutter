import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminder/utils/dbmanager.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DbTaskManager dbmanager = new DbTaskManager();

  final _nameController = TextEditingController();
  final _courseController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Task task;
  DateTime datepick;
  List<Task> taskList;
  int updateIndex;
  String selectedDate = 'Pick date';
  Future pickDate() async {
    datepick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025));
    if (datepick != null)
      setState(() {
        _dateController.text =
            DateFormat("dd-MM-yyyy").format(datepick).toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add New Task", style: TextStyle(color: Colors.deepPurple),)),
        backgroundColor: Colors.purple[100],
        
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Enter your task',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent))),
                    controller: _nameController,
                    validator: (val) =>
                        val.isNotEmpty ? null : 'Task Should Not Be empty',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: 'Description',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent))),
                    controller: _courseController,
//                    validator: (val) =>
//                        val.isNotEmpty ? null : 'Description Should Not Be empty',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: pickDate,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.date_range,
                            color: Colors.blue,
                            size: 30,
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          Text(
                            _dateController.text,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    child: Container(
                        width: width * 0.9,
                        child: Text(
                          'Submit',
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {
                      _submitStudent(context);
                      //Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (task == null) {
        if(_dateController.text.isEmpty){
          _dateController.text = DateFormat("dd-MM-yyyy").format(DateTime.now()).toString();
          datepick = DateTime.now();
        }

        Task st = new Task(
            task: _nameController.text,
            desc: _courseController.text,
            date: datepick.toString());
        dbmanager.insertTask(st).then((id) => {
              _nameController.clear(),
              _courseController.clear(),
              _dateController.clear(),
              print('${datepick.toString()}')
            });
      } else {
        task.task = _nameController.text;
        task.desc = _courseController.text;

        dbmanager.updateTask(task).then((id) => {
              setState(() {
                taskList[updateIndex].task = _nameController.text;
                if(!_courseController.text.isEmpty)
                  taskList[updateIndex].desc = _courseController.text;
                taskList[updateIndex].date = _dateController.text;
              }),
              _nameController.clear(),
              _dateController.clear(),
              _courseController.clear(),
              task = null
            });
      }
    }
  }
}
