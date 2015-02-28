
Mins timerMins;
Sec timerSec;
MilliSec timerMillis;

class Mins {
 
  int savedTime; 
  int wholeTime;
  
  Mins(int tempWholeTime) {
    wholeTime = tempWholeTime;
  }
  
  void start() {
    savedTime = millis(); 
  
  }

  boolean isFinished() { 
    int timeThatsPassed = millis()- savedTime;
    if (timeThatsPassed > wholeTime) {
      return true;
    } else {
      return false;
    }
  }
}

class Sec {
 
  int savedTime; 
  int wholeTime;
  
  Sec(int tempWholeTime) {
    wholeTime = tempWholeTime;
  }
  
  void start() {
    savedTime = millis(); 
  
  }

  boolean isFinished() { 
    int timeThatsPassed = millis()- savedTime;
    if (timeThatsPassed > wholeTime) {
      return true;
    } else {
      return false;
    }
  }
}

class MilliSec {
 
  int savedTime;
  int wholeTime;
  
  MilliSec(int tempWholeTime) {
    wholeTime = tempWholeTime;
  }
 
  void start() {
    savedTime = millis(); 
  }
  
  boolean isFinished() { 
    int timeThatsPassed = millis()- savedTime;
    if (timeThatsPassed > wholeTime) {
      return true;
    } else {
      return false;
    }
  }
}

void setup() {
  background (255, 165, 0);
  noStroke();
  size(600,600);
  smooth();
  timerMins = new Mins(60000);
  timerMins.start();
  timerSec = new Sec(1000);
  timerSec.start();
  timerMillis = new MilliSec(1);
  timerMillis.start();
}

void draw() {
    if (timerMins.isFinished()) {
    fill(255, 85);
    ellipse(random(120, 480), random(100, 100), 40, 40);
    timerMins.start();
  }
   if (timerSec.isFinished()) {
    fill(255, 85);
    ellipse(random(110, 490), random(200, 300), 20, 20);
    timerSec.start();
  }
    if (timerMillis.isFinished()) {
    fill(255, 15);
    ellipse(random(105, 495), random(400, 500), 10, 10);
    timerMillis.start();
  }
}
void mousePressed() {
  fill (255, 165, 0);
  rect (0, 0, 600, 600);
  }


