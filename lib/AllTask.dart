import 'package:flutter/material.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
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
                  child: Text("hae"),
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
                  child: Text("hae"),
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
                  child: Text("hae"),
                ),
            ),
          ),
        ]),
        
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
          onPressed: () {},
        ),
      ),
    );
  }

  Widget appbar() {
    return Container(
      height: 200,
      padding: EdgeInsets.only(top: 42, bottom: 16, right: 16, left: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 3), color: Colors.black12, blurRadius: 6)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
    );
  }
}
