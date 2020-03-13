class Task{
  
  int _id;
  String _task;
  String _date;
  String _desc;
  // konstruktor versi 1
  Task(this._task, this._date, [this._desc] );
  Task.withId(this._task, this._date, [this._desc] );
 
  //getter dan setter (mengambil dan mengisi data kedalam object)
  // getter
  int get id => _id;
  String get task => _task;
  String get date => _date;
  String get desc => _desc;
  // setter  
  set task(String value) {
    if(value.length <= 255){
    _task = value;
    }
  }
  set date(String value) {
    this._date = value;
  }
  set desc(String value) {
    if(value.length <= 255){
    _desc = value;
    }
  }
  
  // konversi dari Contact ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    
    map['task'] = _task;
    map['date'] = _date;
    map['desc'] = _desc;
    return map;
  }  

   // konstruktor versi 2: konversi dari Map ke Contact
  Task.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._task = map['task'];
    this._date = map['date'];
    this._desc = map['desc'];
  }
}