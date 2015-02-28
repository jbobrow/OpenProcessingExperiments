
// Dan Sztanga
// dsztanga@gmail.com
// (C) 2012 Dan Sztanga. All rights reserved.
// HW_3 User Input

//Variables
float x, y, wd, ht, diam, theta, thickl, thickh, rot;
boolean press;

void setup()
{
  size(1000,500);
  background(255);
  thickl = 5;
  thickh = 20;
  theta = 0;
  rot = 0;
  mouseX = 500;
  mouseY = 250;
  noCursor();
}

void draw()
{
  //Fade
  noStroke();
  fill(255,255,255,10);
  rect(0,0,1000,500);
  
  //Rotating Line with Color Change
  if (rot == 0){
    stroke(255, 170, 0, random(25, 100));
  }
   if (rot == 1){
    stroke(255, 60, 0, random(25, 100));
  }
   if (rot == 2){
    stroke(255, 255, 0, random(25, 100));
  }
   if (rot == 3){
    stroke(0, 237, 13, random(25, 100));
  }
   if (rot == 4){
    stroke(0, 227, 237, random(25, 100));
  }
  strokeCap(SQUARE);
  strokeWeight(random(thickl, thickh));
  line((20 * cos(radians(theta))) +  mouseX, (20 * sin(radians(theta))) + mouseY, (diam/2 * cos(radians(theta))) +  mouseX, (diam/2 * sin(radians(theta))) + mouseY);
  diam = random(100,400);
  theta = theta + 5;
  
  //Mouse Press Inleases Thickness
  if (press == true) {
    thickl = 20;
    thickh = 40;
  } else {
    thickl = 5;
    thickh = 25;
  }
 
  //Resets Theta to 0
  if (theta == 360) {
    theta = 0;
  }
}

//Checks for Mouse Button Press
void mousePressed() {
  press = true;
}

void mouseReleased() {
press = false;
}

//Key Press for Color Change
void keyPressed() {
 if (key == CODED) {
  if (keyCode == RIGHT) {
    rot = rot + 1;
    if (rot > 4) {
      rot = 0;
    }
  }
  if (keyCode == LEFT) {
    rot = rot - 1;
    if (rot < 0) {
      rot = 4;
    }
  }
 }
}



