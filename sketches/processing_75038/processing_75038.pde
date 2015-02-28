
// DEFINE BALL CLASS
class Ball {
  //DEFINE DATA THAT BALL WILL ACCEPT
  color c;
  float xpos;
  float ypos;
  float diam;
  float speedx;
  float speedy;
  
  // CONSTRUCTOR THAT DEFINES WHAT A BALL IS
  
  Ball() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    xpos = (random(0, width));
    ypos = (random(0, height));
    speedx = random(-5, 25);
    speedy = random(-5, 10);
    diam = random(20, 50);
  }
  
  //FUNCTION TO DISPLAY THE BALL IN REAL LIFE
  
  void display() {
    
    fill(c);
    noStroke();
    rect(xpos, ypos, diam, diam);
  }
  
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

  void increasespeedx() {
    speedx = speedx + 1;
    speedy = speedy + 1;
  }

  void decreasespeedy() {
    speedx = speedx - 1;
    speedy = speedy - 1;
  }
  
 
}


