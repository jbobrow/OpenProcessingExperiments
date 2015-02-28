
// This sketch is based on the tutorial at:
// http://processing.org/learning/objects/
// which is in turn based on the book Learning Processing.
// This tweek adds a movement in the Y axis and the 
// ability to change the x and y acceleration.
// Believe it or not this is ground work for a Jepardy style 
// game board. My next tweek will be to add goal X and Y
// variables to the class and functions to move the boxes
// towards those goal positions.


// These kick variables set the X and Y 
// speeds of each car variable.
int kick1X, kick1Y, kick2X, kick2Y;

class Car {
  
  color c;
  float xpos; // x position
  float ypos; // y postiion
  float xvel; // x velosity
  float yvel; // y velosity
  
  // default constructor
  Car() {
    
    c = color(255);
    xpos = width/2;
    ypos = height/2;
    xvel = 1.0;
    yvel = 1.0;
    
  }
  // The Constructor is defined with arguments.
  Car(color tempC, float tempXpos, float tempYpos, float tempxvel, float tempyvel) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xvel = tempxvel;
    yvel = tempyvel;
  }
  
 void display() {
   rectMode(CENTER);
   fill(c);
   rect(xpos,ypos,60,60);
 }
 
 void setVelocities(int newxvel, int newyvel) {
   xpos = xpos + newxvel;
   ypos = ypos + newyvel;
     
   if (xpos > width) {
     xpos = 0;
   }
   if (ypos > height) {
     ypos = 0;
   }
   if (xpos < 0) {
     xpos = width;
   }
   if (ypos < 0) {
     ypos = height;
   }
 }
} // end of car class

Car jimCar1;
Car jimCar2;


void setup() {
  size(1200,680);
 // Parameters go inside the parentheses when the object is constructed.
  jimCar1 = new Car(color(255,0,0),0,100,2,3); 
  jimCar2 = new Car(color(0,0,255),0,10,3,-1);
  
  kick1X = 2;
  kick1Y = 3;
  kick2X = 3;
  kick2Y = -1;
}

void draw() {
  background(255);
  jimCar1.setVelocities(kick1X,kick1Y);
  jimCar1.display(); 
  jimCar2.setVelocities(kick2X,kick2Y);
  jimCar2.display(); 
  
}

