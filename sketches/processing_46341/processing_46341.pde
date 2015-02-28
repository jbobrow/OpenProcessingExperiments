
int startTime;
int lastTime;
class timer {
  
  timer() {
    startTime=lastTime = millis();
  }
  
  int elapsed() {
    int elapsed = millis()-startTime;
    lastTime = millis();
    return elapsed;
  }

  int elapsedS() {
    int elapsed = millis()-startTime;
    lastTime = millis();
    return elapsed/1000;
  }
}

