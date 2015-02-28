
//class didn't work, percentages didn't work, unable to constrain mouse to rectangle, unable to stop the rectangle from reversing (why is it even reversing at all???), fail

//Hourglass hourglass1;
float rX, rY, timer, inc, shrinkeffect;
PImage watch;


void setup() {
  noStroke();
  rectMode(CENTER);
  noCursor();
  watch = loadImage("watch.png");
  //hourglass1 = new Hourglass(60000);
  inc = .2;
  size (600, 600);
  rX = 600;
  rY = 600;
  frameRate(60);
  //if (rY == 0 || rX == 0){
  // rY=0;
  // rX=0;
  // }
  //timer = millis()/1000;
}

void draw() {
  background (0);
  float mx = constrain(mouseX, inc, 600-inc);
  float my = constrain(mouseY, inc, 600-inc);
  fill(255);
  //hourglass1.start();

  rect(width/2, height/2, rX, rY);
  image(watch, mx, my);
  rX -= inc;
  rY -= inc; //size must decrease by a fractional amount dependent on the amount of time passed


  if (rX == 0) {
    inc = 0;
  }
  println (timer);
}


//class Hourglass {
//  int savedTime;
//  int totalTime;
//  
//  Hourglass(int tempTotalTime) {
//    totalTime = tempTotalTime;
//  }
//  
//  void start(){
//    savedTime = millis();
//    rX = rX - (savedTime/10000);
//    rY = rY - (savedTime/10000);
//  }
//  
//  boolean isFinished(){
//    int passedTime = millis() - savedTime;
//    if (passedTime > totalTime){
//      return true;
//    } else {
//      return false;
//    }
//  }
//}


