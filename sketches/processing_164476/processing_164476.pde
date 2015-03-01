
/* @pjs preload="pumpkin.png"; */
PImage pumpkin;

void setup() {
  pumpkin = loadImage("pumpkin.png");
  size(500,500);
  background (0);
  noLoop();
}

void draw() {
  int d = day();
  int m = month();
  if ((d == 31) && (m == 10)) {
    image(pumpkin,125,125);
    println("Happy Halloween!");
  }
}


