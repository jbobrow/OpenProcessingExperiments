
// DEFINE BALL CLASS
class Ball {
  //DEFINE DATA THAT BALL WILL ACCEPT
  color c;
  float xpos;
  float ypos;
  float diam;
  float speedx;
  float speedy;
//===================================================================================================
  // CONSTRUCTOR THAT DEFINES WHAT A BALL IS

  Ball() {
    c = color(0);
    xpos = (random(0, width));
    ypos = (random(0, height));
    speedx = random(1);
    speedy = random(1);
    diam = random(1,10);
  }
//===================================================================================================
  //FUNCTION TO DISPLAY THE BALL IN REAL LIFE

  void display() {
    ellipseMode(CENTER);
    fill(c);
    noStroke();
    ellipse(xpos, ypos, diam, diam);
  }
//===================================================================================================
  //FUNCTION OF THE BALL TO BOUNCE FOREVER

  void bounce() {

    xpos = xpos + speedx;
    ypos = ypos + speedy;

    if ( 0 > xpos || xpos > width) {
      speedx = speedx * -1;
    }

    if ( 0 > ypos || ypos > height) {
      speedy = speedy * -1;
    }
  }
//===================================================================================================
  void increasespeed() {
    speedx = speedx + 1;
    speedy = speedy + 1;
  }
//===================================================================================================
  void decreasespeed() {
    speedx = speedx - 1;
    speedy = speedy - 1;
  }
//===================================================================================================
  void showspeed() {
    //rectMode(CENTER);
    fill(0, 27, 107);
    rect(width-50, 0, 50, height);
    strokeCap(SQUARE);
    strokeWeight(50);
    stroke(122, 156, 255);
    line(width-25, height, width-25, abs((arrayofballs[0].speedx)*1000));
  }
}


