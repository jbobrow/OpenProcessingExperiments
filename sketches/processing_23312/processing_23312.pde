
// declare the array and set size
import processing.opengl.*;
Sinewave [] waves = new Sinewave [100];

void setup () {

  size (1000, 700, OPENGL);
  smooth ();

  // use array to fill class with values
  for (int i=0; i <waves.length; i++) {

    float xpos = width/(waves.length)*i + width/(waves.length)*(.5);
    float ypos = height/2;
    float theta = .9*i;
    float tChange =.1;
    int radius = 1;
    int r = 50;

    waves[i] = new Sinewave (xpos, ypos, theta, tChange, radius, r);
  }
}

void draw () {

  background (0);

  // call the array to display all
  for (int i = 0; i < waves.length; i++) {
    waves[i].display();
  }
}

class Sinewave {
  // data
  float xpos;
  float ypos;
  float theta;
  float tChange;
  int radius;
  int r;

  // constructor

    Sinewave (float tempX, float tempY,float tempTheta, float tempTChange, int tempRadius, int tempR) {

    xpos= tempX;
    ypos= tempY;
    theta = tempTheta;
    tChange= tempTChange;
    radius = tempRadius;
    r = tempR;
  }

  //methods and functions

  void display () {
    rectMode(CENTER);
    stroke (map (xpos, 0, width, 100, 255), 50+map(xpos, 0, width, 50, 200), map(xpos, 0, width, 0, 255));
    strokeWeight(.5);
    noStroke();
    
    float x = r*cos(theta); //add random values to jitter
float y = r* sin (theta); //add random values to jitter
;

    rotateY(radians(PI/4));
        fill ( 150+80*cos(theta),100+100*sin(theta), map(xpos, 0, width, 0, 255));
    ellipse ( ypos + sin(theta)*r+y+300,xpos-20, radius+200, 100+cos(theta)*40);
    //increment theta
    theta += tChange;
    
    if((ypos>=200) || (ypos<200)) {
    ypos = 200;
    
    }
    
    

  }
}


