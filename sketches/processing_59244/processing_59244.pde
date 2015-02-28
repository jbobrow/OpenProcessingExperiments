
Timer timer;
int i=1;
void setup() { 
  size(200, 200); 
  background(255,0,0); 
  timer = new Timer(1000); 
  timer.start();
}

void draw() { 

  if (timer.isFinished()) {
    background(255);
    fill(0);
    textSize(180); 
    text(i,50,160);
    i++;
    timer.start();
    if (i==7) {
      i=1;
      background(255,0,0);
    }
  }
} 

class Timer {
  int savedTime; // When Timer started 
  int totalTime; 
  // How long Timer should last

  Timer(int tempTotalTime) { 
    totalTime = tempTotalTime;
  }
  // Starting the timer 
  void start() {
    savedTime = millis();
  }
  boolean isFinished() { // Check how much time has passed 
    int passedTime = millis()-savedTime; 
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}


