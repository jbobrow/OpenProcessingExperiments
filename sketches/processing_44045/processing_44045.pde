
// try to reproduce figures in Dehlinger (1998)
// 1: draw a row of grasses
// schien@mail.ncku.edu.tw


void setup() {
  size(300, 500);
  background(255);
  smooth();
  noLoop();
}

void draw() {
  float xstep = 5;
  float border = 50;
  float x = 50;
  float y = 100;

  // draw grass positions
  stroke(0);
  //strokeWeight(2);
  for (x=border; x<=width-border; x+=xstep) {
    point(x, y);
  }

  // draw grasses
  stroke(20, 20, 100, 80);
  strokeWeight(1);
  for (x=border; x<=width-border; x+=xstep) {
    float tipy = y - 20 - random(40);
    float tipx = x + random(20) - 10;
    line(x, y, tipx, tipy);
  }
}

void mousePressed() {
  redraw();
  saveFrame("RowofGrass_###.png");
}


