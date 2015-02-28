
import netscape.javascript.*;

//Simone Bradley
//Homework Project #2
//Safari Scene
//Click the top half to change the placement of the sun, and click the bottom in order to see the meerkat holes.

PImage img;

void setup () {
  background (255);

  size (700, 500);
  img = loadImage ("serengeti-landscape2.jpg");
  image (img, 0, 0);
}

void draw () {
}

void mousePressed () {
  int x;
  int y;
  x=mouseX;
  y=mouseY;
  float horizon=425.0;
  int r=2000;

  if (y<horizon) {

    fill (255, 246, 13);
    ellipse (x, y, r/y, r/y);
  }
  
  int x2;
  int y2;
  x2=mouseX;
  y2=mouseY;
  float horizon2=425.0; 

  
  if (y>horizon) {
  float r2=(y-horizon)*.05;
    fill (141, 61, 23);
    ellipse (x, y, r2*(y/20), r2*(y/20));
  }
}


