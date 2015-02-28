
Alien[] aliens;
Timer timer; 
 
void setup() {
  frameRate(10);
  size(800, 800);
  timer = new Timer(2000); //"Aliens" appear every 2000 ms
  timer.start(); //Start the timer
  aliens = new Alien[0]; //initialize Alien index 0
}
  
void draw() {
  background(250);
  if (timer.isFinished()) { // If 2000 ms have passed:
    timer.start();
    //New Alien object
    Alien myAlien = new Alien(mouseX, mouseY);
    //Append to array
    aliens = (Alien[]) append(aliens, myAlien);
  }
  
  for (int i=0; i<aliens.length; i++) {
    aliens[i].display();
    aliens[i].move();
  }
}

/* 
void mousePressed() {
  //New Alien object
  Alien myAlien = new Alien(mouseX, mouseY);
  //Append to array
  aliens = (Alien[]) append(aliens, myAlien);
} */

class Timer {
  
  int savedTime; //When timer started
  int totalTime; //How long timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  //Starting the timer
  void start() {
    //When the timer starts it stores the current time in millisecond
    savedTime = millis();
  }
  
  //The function isFinished() returns true if 2000 ms have passed.
  boolean isFinished() {
    //Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
 
class Alien {
  //center points
  int cx;
  int cy;
  int cxShadow;
  int cyShadow;
  //colors and stroke weights
  int purple;
  int orange;
  int background;
  int legWeight;
  int eyeWeight;
  //legs
  float legX;
  float legY;
  int spokeLength;
  int howMany;
  //center eyeball
  float outsideW;
  float insideW;
  //outside eyeballs
  float orangeOutsideW;
  float orangeInsideW;
    
  float xSpeed;
  float ySpeed;
  float cxSpeed;
  float cySpeed;
  float angle;
  float offset;
   
  int[] spokeLengthList; //need arrays to generate random values 2
  int[] orangeList;
  int[] orangeOutsideWList;
  int[] orangeInsideW;
   
  boolean moveRight; //for the movement: to make them "bounce" off the walls
  boolean moveDown;
   
  Alien(int centerX, int centerY) {
     
    cx = random(0, 800);
    cy = random(0, 800);
    cxShadow = cx + 5;
    cyShadow = cy + 5;
    shadow = color(150, 100);
    xSpeed = int(random(-12, 12));
    ySpeed = int(random(-12, 12));
    cxSpeed = xSpeed;
    cySpeed = ySpeed;
    howMany = 6; //number of legs
    angle = 60; //6 legs, so the angles are 60 degrees apart
    offset = 0; //so legs rotate together
    //outsideW= random(30, 40); //width of outer purple circles
    //insideW= random(20, 25); //width of inner purple circles
    purple= color(random(100), 0, random(50, 100), 150);
    eyeWeight= random(1,3); //strokes of the "eyes"
     
    spokeLengthList = new int[howMany]; //initialize arrays
    orangeList = new int[howMany];
    orangeOutsideWList = new int[howMany];
    orangeInsideWList = new int[howMany];
     
    //moveRight = true; //start out moving down and to the right
    //moveDown = true;
    
   for(int i=0; i<howMany; i++) {
     spokeLength = int(random(40, 80));
     orange = color(random(140, 240), random(50, 80), 50, 150);
     orangeOutsideW= random(15, 25);
     orangeInsideW= random(4, 10);
     spokeLengthList[i] = spokeLength;
     orangeList[i] = orange;
     orangeOutsideWList[i] = orangeOutsideW;
     orangeInsideWList[i] = orangeInsideW;
   }
     
  }
   
void display() {
 ////////////////////////// SHADOWS /////////////////////////////
  //Need to use a loop for the multiple legs and "eyes" on the ends of them
   for (int i = 0; i < howMany; i++) {
     spokeLength = spokeLengthList[i];
     orange = orangeList[i];
     orangeOutsideW = orangeOutsideWList[i];
     orangeInsideW = orangeInsideWList[i];
     outsideW= random(30, 40); //width of outer purple circles
     insideW= random(20, 25); //width of inner purple circles
      float legX = cxShadow + cos(radians(angle*i+offset))* spokeLength;
      float legY = cyShadow + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(shadow);
      strokeWeight(3);
      line(cxShadow, cyShadow, legX, legY);
      //eyeballs:
      fill(shadow);
      noStroke();
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(shadow);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
  }
   
  //CENTER EYEBALL:
    //outside circle:
      fill(shadow);
      noStroke();
      ellipse(cxShadow, cyShadow, outsideW, outsideW);
    //inside circle:
      noStroke();
      fill(shadow);
      ellipse(cxShadow, cyShadow, insideW, insideW);
      
 //////////////////////// ALIENS //////////////////////////////
      
  for (int i = 0; i < howMany; i++) {
     spokeLength = spokeLengthList[i];
     orange = orangeList[i];
     orangeOutsideW = orangeOutsideWList[i];
     orangeInsideW = orangeInsideWList[i];
     outsideW= random(30, 40); //width of outer purple circles
     insideW= random(20, 25); //width of inner purple circles
      float legX = cx + cos(radians(angle*i+offset))* spokeLength;
      float legY = cy + sin(radians(angle*i+offset))* spokeLength;
      //legs:
      stroke(100, 200);
      strokeWeight(3);
      line(cx, cy, legX, legY);
      //eyeballs:
      fill(250);
      stroke(orange);
      strokeWeight(eyeWeight);
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(orange);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
  }
   
  //CENTER EYEBALL:
    //outside circle:
      fill(250);
      stroke(purple);
      ellipse(cx, cy, outsideW, outsideW);
    //inside circle:
      noStroke();
      fill(purple);
      ellipse(cx, cy, insideW, insideW);
      
} 
 
 
void move() {
   offset+= 4; //rotation
    
   cx=cx+xSpeed;
   cy=cy+ySpeed;
    
   if (cx>width || cx<0) {
     xSpeed *= -1;
   }
    
   if (cy> height || cy<0) {
     ySpeed*= -1;
   }
  
   cxShadow=cxShadow+cxSpeed;
   cyShadow=cyShadow+cySpeed;
    
   if (cxShadow>width +5  || cxShadow<5) {
     cxSpeed *= -1;
   }
    
   if (cyShadow> height +5 || cyShadow<5) {
     cySpeed*= -1;
   }
   
    
 }
 
}



