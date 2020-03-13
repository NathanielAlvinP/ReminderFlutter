import 'package:flutter/material.dart';
import 'package:remember/models/task.dart';
import 'package:remember/task_detail.dart';
import 'package:remember/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Task> taskList;
  int count = 0; 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            flexibleSpace: Positioned(
                child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hy dude',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "what your plan?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )),
            bottom: TabBar(
              unselectedLabelColor: Colors.purple,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.purpleAccent,
              ),
              tabs: <Widget>[
                Tab(
                  text: 'Today',
                ),
                Tab(
                  text: 'Tomorrow',
                ),
                Tab(
                  text: 'Next 7 Days',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: getNoteListView(),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: getNoteListView(),
                )),
            ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: getNoteListView(),
                ),
            ),
          ),
        ]),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: 50,
            child: Row(
              children: <Widget>[
                SizedBox(width: 30.0),
                IconButton(
                  color: Colors.orange[300],
                  icon: Icon(
                    Icons.archive,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                Spacer(),
                IconButton(
                  color: Colors.blue[300],
                  icon: Icon(Icons.calendar_today, size: 30,),
                  onPressed: () {},
                ),
                SizedBox(width: 30.0),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple[300],
          child: Icon(
            Icons.add,
            color: Colors.purple[100],
          ),
          onPressed: () {Navigator.pushNamed(context, '/addTask');},
        ),
      ),
    );
  }
  ListView getNoteListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: count,
			itemBuilder: (BuildContext context, int position) {
				return Card(
					color: Colors.white,
					elevation: 2.0,
					child: ListTile(
            title: Text(this.taskList[position].task, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            subtitle: Text(this.taskList[position].desc),
            trailing: Text(this.taskList[position].date),


						onTap: () {
							debugPrint("ListTile Tapped");
							navigateToDetail(this.taskList[position]);
						},

					),
				);
			},
		);
  }
  void navigateToDetail(Task task) async {
	  bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return TaskDetail(task);
	  }));

	  if (result == true) {
	  	updateListView();
	  }
  }
  void updateListView() {

		final Future<Database> dbFuture = databaseHelper.intializeDatabase();
		dbFuture.then((database) {

			Future<List<Task>> taskListFuture = databaseHelper.getTaskList();
			taskListFuture.then((taskList) {
				setState(() {
				  this.taskList = taskList;
				  this.count = taskList.length;
				});
			});
		});
  }
}

