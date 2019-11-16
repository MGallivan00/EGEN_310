class TimerMove{
  double move_time = 5;
  DateTime start_time  = DateTime.now();

  bool moveAllowed(){
    if(DateTime.now().difference(start_time).inMilliseconds > move_time){
    start_time = DateTime.now();
    return true;
  }
  else{
    return false;
  }
}}