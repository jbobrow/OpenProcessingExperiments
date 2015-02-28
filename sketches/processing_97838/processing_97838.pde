
/*
April 30, Creative Computing
Quick example of how to do state changes in your sketches
Ben Norskov
*/
int SKETCHSTATE = 1;
void setup() {
  size(500, 500);
}
void draw() {
  background(200);
  //draw a cirle, a square, and nothing
  //dependant on # mouseclicks
  if (SKETCHSTATE == 0) {
    background(239, 130, 50);
  }else if (SKETCHSTATE == 1) {
    ellipse(width*.5, height*.5, 200, 200);
  } else if (SKETCHSTATE == 2) {
    rect(200, 200, 200, 200);
  }
}
void mousePressed() {
  SKETCHSTATE++;
  if (SKETCHSTATE > 2) {
    SKETCHSTATE = 0;
  }
}
