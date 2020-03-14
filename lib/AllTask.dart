import 'package:flutter/material.dart';

import 'package:remember/utils/dbmanager.dart';


class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  final DbTaskManager dbmanager = DbTaskManager();

  
  Task task;
  List<Task> taskList;
  int updateIndex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                  child: FutureBuilder(
                    future: dbmanager.getTaskList(),
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
                      taskList = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: taskList == null ? 0 : taskList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Task tsk = taskList[index];
                            return Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'name: ${tsk.task}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'course: ${tsk.desc}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${tsk.date}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                        },
                        );
                      }
                      return new CircularProgressIndicator();
                    }
                    ),
                )
                ),
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
}

