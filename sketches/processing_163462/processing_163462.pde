
/* @pjs preload="zebrafish_larvae.jpg"; */

PImage larvae;

void setup() {
  larvae = loadImage("zebrafish_larvae.jpg");
  size(480, 400);
  noLoop();
}
void draw() {
image(larvae,0,0,480,411);
}


