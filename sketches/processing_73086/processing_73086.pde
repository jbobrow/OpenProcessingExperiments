
/***************************
 Assignment 03
 Name: Meron Kasahun
 E-mail: mkasahun@brynmawr.edu
 Course: CS110 - Section 001
 Submitted: 10/3/2012
 
 This is a sketch of a monkey that blinks when the mouse is in a 
 certain position and a speech bubble appears when the mouse crosses
 the monkey's x,y coordinate.
 ****************************/

PFont f;

void setup() {
  size (500, 500);
  background (92, 205, 247);
  //create text font
  f = createFont ("Marker Felt", 16, true);
  smooth ();

}
//change monkey head size in range of 25-31
int objectSize = int (random(25,32)); 
void draw () {
  drawMonkeyhead(200, 200, objectSize, objectSize);
  drawPoop(220, 450, 70, 70);
}

//object 1
void drawMonkeyhead(float x, float y, float objects, float objectSize) {
  ellipseMode(CENTER);
  //head
  fill (188, 87, 19);
  ellipse (x, y, objectSize*4, objectSize*3);
  //mouth/nose area
  fill (216, 133, 76);
  ellipse (x, y*1.12, objectSize*3, objectSize*1.5);
  //mouth
  fill (0);
  ellipse (x, y*1.12, objectSize*2, objectSize);
  //right ear
  fill (188, 87, 10);
  ellipse (x*1.3, y, objectSize, objectSize/.8);
  //left ear
  fill (188, 87, 10);
  ellipse (x*.7, y, objectSize, objectSize/.8);
  //eyes
  fill (255);
  ellipse (x/.9, y*.95, objectSize, objectSize);
  ellipse (x/1.15, y*.95, objectSize, objectSize);
  //irises
  fill (144, 67, 15);
  ellipse (x/.9, y*.95, objectSize/2, objectSize/2);
  ellipse (x/1.15, y*.95, objectSize/2, objectSize/2);
  //nose
  fill (103, 51, 17); 
  ellipse (x, y*1.02, objectSize/2, objectSize/3);
  //making the eyes blink based on mouse location
  if (mouseY >= y) {
    fill (188, 87, 19);
    ellipse (x/.9, y*.95, objectSize, objectSize);
    ellipse (x/1.15, y*.95, objectSize, objectSize);
  }
  float r = dist(x,y,mouseX,mouseY);
  if (r <= objectSize) {
    fill (255);
    ellipseMode (CENTER);
    ellipse (400,75,190,150);
    ellipse (350,160,40,20);
    ellipse (320,175,30,15);
    ellipse (295,185, 20, 10);
    textFont(f, 16);
    textSize (30);
    textAlign(CENTER);
    fill(random(0,255), random (0,255), random (0,255));
    text("Oops! I pooped!",400,75);
  }
}
//object 2
void drawPoop (float x, float y, float objects, float objectSize) {
  ellipseMode (CENTER);
  fill (106, 45, 4);
  ellipse (x, y, objectSize, objectSize/2);
  ellipse (x, y*.95, objectSize*.8, objectSize/2);
  ellipse (x, y*.9, objectSize*.6, objectSize/2);
}
