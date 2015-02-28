
class Timer { 
  int startTime; 
  int totalTime;
  
  Timer(int totalTime_) {
    totalTime = totalTime_;
  }
  
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    startTime = millis(); 
    //println("timer start at" + startTime);
  }
}

