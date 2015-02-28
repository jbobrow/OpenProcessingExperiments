
// Dan Sztanga
// dsztanga@gmail.com
// (C) 2012 Dan Sztanga. All rights reserved.
// HW_4 User Input_2

/*
Controls_

Move Mouse_ Moves center of circle
Left Mouse Button_ Increase thickness of line
Left and Right Arrow_ Scroll through colors
Up and Down Arrows_ Speed circle up or dowm
Shift_ Change inner diameter
Space Bar_ Change background shade
Enter_ Reset to default

*/

//Variables
float x, y, wd, ht, diam, theta, thickl, thickh, rot, speed, innerdiam, bkg;
boolean press;

void setup()
{
  size(1000,500);
  background(255);
  bkg = 255;
  thickl = 5;
  thickh = 20;
  theta = 0;
  rot = 0;
  speed = 5;
  innerdiam = 20;
  mouseX = 500;
  mouseY = 250;
  noCursor();
}

void draw()
{
  //Fade
  noStroke();
  fill(bkg, 10);
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
  line((innerdiam * cos(radians(theta))) +  mouseX, (innerdiam * sin(radians(theta))) + mouseY, (diam/2 * cos(radians(theta))) +  mouseX, (diam/2 * sin(radians(theta))) + mouseY);
  diam = random(100,400);
  theta = theta + speed;
  
  //Mouse Press Inleases Thickness
  if (press == true) {
    thickl = 20;
    thickh = 40;
  } else {
    thickl = 5;
    thickh = 25;
  }
 
  //Resets Theta to 0
  if (theta > 360) {
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

//Key Press
void keyPressed() {
  //Color Change
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
  //Speed Change
  if (keyCode == UP) {
    speed = speed + 1;
    if (speed > 10) {
      speed = 10;
    }
  }
  if (keyCode == DOWN) {
    speed = speed - 1;
    if (speed < 1) {
      speed = 1;
    }
  }
  //Inner Diameter Change
  if (keyCode == SHIFT) {
    innerdiam = random(20,75);
  }
  //Reset
  if (key == ENTER) {
    background(255);
    bkg = 255;
    thickl = 5;
    thickh = 20;
    rot = 0;
    speed = 5;
    innerdiam = 20;
    mouseX = 500;
    mouseY = 250;
  }
  if (key == ' ') {
    bkg = random(0, 255);
  }
}


