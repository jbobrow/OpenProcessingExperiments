

PImage wheelOne;
PImage wheelTwo;
PImage wheelThree;
PImage backgroundPattern; 
PImage backgroundTint;
float rotOne;
float rotTwo;
float rotThree;

void setup () {
  size(700, 450);
  frameRate(10);
  backgroundPattern = loadImage ("background.jpg");
  wheelOne = loadImage ("wheel1.png");
  wheelTwo = loadImage ("wheel2.png"); 
  wheelThree = loadImage ("wheel3.png");
  rotOne=0;
  rotTwo=0;
  rotThree=0;
  }
  
  void draw () {
  background(backgroundPattern);
  drawRide();
  drawGear();
   }
  
  void drawRide () {
    imageMode(CENTER);
      pushMatrix();
    translate(150, 225);
    rotate(rotOne);
    image(wheelOne, 0,0);
  popMatrix();
  rotOne+=-0.05;
  
    pushMatrix();
    translate(150, 225);
    rotate(rotTwo);
    image(wheelTwo, 0,0);
  popMatrix();
  rotTwo+=0.05;
  }
  
  void drawGear () {
    imageMode(CORNER);
     pushMatrix();
    translate(150, 225);
    rotate(rotThree);
    alpha(50);
    image(wheelThree, 0,0);
  popMatrix();
  rotThree+=0.1;
    }


