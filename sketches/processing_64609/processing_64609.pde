
class Timer {
  int startTime;
  int elapsedTime;
  int timeBase;

  Timer(int timeBase) {
    this.timeBase = timeBase;
    startTime = millis();
  }

  boolean check() {
    if (millis() - startTime >= timeBase) {
      startTime = millis();
      
      return true;
    } 
    return false;
  }
  
  
}


