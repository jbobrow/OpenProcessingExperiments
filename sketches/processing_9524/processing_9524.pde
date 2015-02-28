
// Simple bouncing ball class

class Ball {
  //---
  float floorNum = 50;
  boolean floorHit = false;

  boolean triggerFrame = true;
  int currentFrame = 0;
  int frameCounterOrig=1;
  int frameCounter=frameCounterOrig;
  int frameCounterMaxOrig = 6; // this sets ones, twos, threes, etc.
  int frameCounterMax = frameCounterMaxOrig;
  //---
  float dinoSize = 120;
  float dinoX = 0;
  float dinoY = 0;
  float dinoMoveDeltaOrig = 4;
  float dinoMoveDelta = dinoMoveDeltaOrig;
  boolean jumpSwitch = false;
  PShape[] dinoArray = new PShape[4];
  //---
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
    for (int i=0;i<dinoArray.length;i++) {
      dinoArray[i] = loadShape("dino_walk000"+(i+1)+".svg");
    }
  }

  void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > (height-floorNum)) {
      // Dampening
      floorHit = true;
      speed = speed * -0.8;
      y = (height-floorNum);
    }
    if(floorHit){
      x-=abs(speed);
      x--;

    }
    //println(speed);
  }

  boolean finished() {
    // Balls fade out
    life--;
    if (x<-80) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    // Display the circle
    //fill(0,life);
    //stroke(0,life);
    //ellipse(x,y,w,w);
    shapeMode(CENTER);
    shape(dinoArray[currentFrame],x,y,w,w);
    if(floorHit==true){

        frameHandler(6);
      
    } 
   if (floorHit==false) {
      frameHandler(1);
    }
  }

  void frameHandler(int f) {
    frameCounterMaxOrig = f;

    if(frameCounterMaxOrig > 0){
      if(frameCounter<frameCounterMax) {
        triggerFrame=false;
        frameCounter++;
      } 
      else if (frameCounter>=frameCounterMax) {
        triggerFrame=true;
        frameCounter=frameCounterOrig;
      }
      //---
      if (triggerFrame==true) {
        if (currentFrame<dinoArray.length-1) {
          currentFrame++;
        } 
        else {
          currentFrame = 0;
        }
      } 
    }
  }
}  






