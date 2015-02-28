
/* 
 Author: mohan 
 Purpose:Homework Green, Green Grass of Home 
 Concept: Bird's Nest.
 */


void setup() {
  size(550, 550);
  background(0);
  strokeWeight(1);
  stroke(100, 300, 200, 3);
  line(20, 50, 480, 50);
  // noLoop();
  frameRate(5);
}
void draw() {

  float xstep = 1;
  float lastx = -999;
  float lasty = -999;
  float angle = 0;
  float y = 0;
  for (int x=20;x<=530;x+=xstep) {
    rotate(1);
    // rotate(random(0.9,1));

    if (lastx > -999) {

      line(x, x+y-10, lastx, lastx+lasty-10);
      stroke(150, 200, 2, 2);
      //  line(x, rad-10, lastx, lastx+lasty-10);
      stroke(100, 300, 200, 2);
      strokeWeight(2);
    }

    lastx = x;
    angle++;
  }
}


