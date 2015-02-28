
// hw 2/11/14
// motion, hitting walls, etc

// hw 2/14/14
// loops

// hw 2/18/14
// functions

// hw 2/20/14
// OOP

float x,y; // save cur mouse positions
float yspeed = 0;
float xspeed = 0;
float diam = 20;
float radius = diam/2;
Cone c = new Cone(20);
 
void setup() {
  size (400,400);
  smooth();
  noStroke();
  x = width/2;
  y = height/2;
}
 
void draw() {
  clicked();
  ifHitWall();
  behavior();
}

// function
void clicked() {
  if (mousePressed == true) {
    x = mouseX;
    y = mouseY;
    yspeed = mouseY - pmouseY;
    xspeed = mouseX - pmouseX;
  }
}
 
// motion
// function
void ifHitWall() {
  if (y >= height - radius) {
    y = height - radius;
    yspeed = -yspeed/1.15;
  }
  if (y <= radius) {
    y = radius;
    yspeed = -yspeed/1.35;
  }
  if (x >= width -radius) {
    x = width -radius;
    xspeed = -xspeed/1.10;
  }
  if (x <= radius) {
    x = radius;
    xspeed = -xspeed/1.10;
  }
}

// function
void behavior() {
  background(255);
  fill (150 - xspeed*10,150 - yspeed*10,255);
//  if (diam < 2) {
//    diam = 2;
//  }
//  if (diam > 400) {
//    diam = 400;
//  }
  c.makeCone();
  radius = diam/2;
  //loop
  for ( int i = 0; i < 50; i++ ) {
    ellipse(x-i*2,y-i*2,diam-i*2,diam-i*2);
  }
  yspeed = yspeed += 0.2;
  xspeed = xspeed/1.005;
  y = y + yspeed;
  x = x + xspeed;
}
class Cone {
  float diam, radius;
  Cone ( float temp_diam ) {
    diam = temp_diam;
    radius = temp_diam/2;
  }
  void makeCone() {
//    background(255);
//    fill (150 - xspeed*10,150 - yspeed*10,255);
    if (diam < 2) diam = 2;
    if (diam > 400) diam = 400;
    radius = diam/2;
    //loop
//    for ( int i = 0; i < 50; i++ ) {
//      ellipse(x-i*2,y-i*2,diam-i*2,diam-i*2);
//    }
//    yspeed = yspeed += 0.2;
//    xspeed = xspeed/1.005;
//    y = y + yspeed;
//    x = x + xspeed;
  }
}


