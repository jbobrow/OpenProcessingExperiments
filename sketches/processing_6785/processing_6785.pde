
static final int tileSize = 50;
boolean firstFrame;

void setup() {
  size(900, 450);
  background(255, 255, 255);
  stroke(0);
  smooth();
  //noLoop();
  noFill();
  frameRate(5);
  firstFrame = true;
}

void drawInitial() {
  float dx = tileSize * cos(radians(30)) * 2;
  int l = 0;
  for (float y = 0; y < height + tileSize; y += tileSize / 2) {
    for (float x = l % 2 * dx / 2; x < width + tileSize; x += dx) {
      module(x, y, tileSize, (int)random(6));
    }
    l++;
  }
}

void draw() {
  if (firstFrame) {
      drawInitial();
      firstFrame = false;
      return;
  }
  float dx = tileSize * cos(radians(30)) * 2;
  int l = (int) random(2 * height / tileSize);
  float y = l * tileSize / 2;
  float x = l % 2 * dx / 2 + (int) random(width / dx) * dx;
  blankModule(x, y, tileSize);
  stroke(0, 0, 0);
  module(x, y, tileSize, (int) random(6));
}

void blankModule(float cx, float cy, float size) {
  translate(cx, cy);
  noSmooth();
  fill(255, 255, 255);
  noStroke();
  float side = size * tan(radians(30));
  quad(-side, 0, 0, 0, side / 2, -size / 2, -side / 2, -size / 2);
  quad(0, 0, side / 2, size / 2, side, 0, side / 2, -size / 2);
  quad(-side, 0, -side / 2, size / 2, side / 2, size / 2, 0, 0);
  noFill();
  stroke(0, 0, 0);
  smooth();
  translate(-cx, -cy);
}

void module(float cx, float cy, float size, int rotation) {
  translate(cx, cy);
  rotate(rotation * PI / 3);
  float smallArcRadius = size * tan(radians(30)) / 2;
  float bigArcRadius = size * cos(radians(30));
  arc(-size / (2 * cos(radians(30))), 0, smallArcRadius * 2, smallArcRadius * 2, -PI / 3, PI / 3);
  arc(bigArcRadius, -size / 2, bigArcRadius * 2, bigArcRadius * 2, 2 * PI / 3, PI);
  arc(bigArcRadius, size / 2, bigArcRadius * 2, bigArcRadius * 2, PI, 4 * PI / 3);
  rotate(-rotation * PI / 3);
  translate(-cx, -cy);
}


