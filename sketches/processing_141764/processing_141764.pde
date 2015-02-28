
Alien[] aliens;

void setup() {
  frameRate(10);
  size(800, 800);
  background(250);
  aliens = new Alien[0]; //initialize Alien index 0
}
 
void draw() {
  background(250);
  //Update and Display Aliens
  for (int i=0; i<aliens.length; i++) {
    aliens[i].display();
    aliens[i].move();
  }
}

void mousePressed() {
  //New Alien object
  Alien myAlien = new Alien(mouseX, mouseY);
  //Append to array
  aliens = (Alien[]) append(aliens, myAlien);
}

class Alien {
  //center points
  int cx;
  int cy;
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
  float angle;
  float offset; 
  
  int[] spokeLengthList; //need arrays to generate random values
  int[] orangeList;
  int[] orangeOutsideWList;
  int[] orangeInsideW;
  
  boolean moveRight; //for the movement: to make them "bounce" off the walls
  boolean moveDown;
  
  Alien(int centerX, int centerY) {
    
    cx = mouseX;
    cy = mouseY;
    xSpeed = int(random(-12, 12));
    ySpeed = int(random(-12, 12));
    howMany = 6; //number of legs
    angle = 60; //6 legs, so the angles are 60 degrees apart
    offset = 0; //so legs rotate together
    outsideW= random(30, 40); //width of outer purple circles
    insideW= random(20, 25); //width of inner purple circles
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
  //Need to use a loop for the multiple legs and "eyes" on the ends of them
  for (int i = 0; i < howMany; i++) {
     spokeLength = spokeLengthList[i];
     orange = orangeList[i];
     orangeOutsideW = orangeOutsideWList[i];
     orangeInsideW = orangeInsideWList[i];
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
      
  /* if (moveRight) { //If moveRight is true, move right
     cx=cx+speed;
   }
   if (!moveRight) { //If moveRight is false, move left
     cx=cx-speed;
   }
   if (cx>=width) { //start out true (moving right), when you get to right side move left
     moveRight = false;
   } 
   else if (cx<=0) { //when you get to left side move right again
     moveRight = true;
   }
   
   if (moveDown) { //If moveDown is true, move down
     cy=cy+speed;
   }
   if (!moveDown) { //If moveDown is false, move up
     cy=cy-speed;
   }
   if (cy>=height) { //When you get to bottom, start moving back up
     moveDown = false;
   }
   else if (cy<=0) {
     moveDown = true; //When you get to the top, move back down
   }*/
   
 }

}

  


