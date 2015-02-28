
float wx;
float wy;
float cx;
float cy;


void setup() {
  smooth();
  size(400, 400);
  frameRate(60);
}

void draw() {
  background(0);
  wx = map(mouseX, 1, width, 1, 10);
  wy = map(mouseY, 1, width, 1, 10);
  if (mouseButton == LEFT) {
    cx = map(wx*wy, 1, 100, 0, 255);
    cy = map(wx*wy, 1, 100, 255, 0);
  } 
  else {
    cy = cx = 255;
  }
  stroke(cy, cx, 255);
  if (mouseButton == RIGHT) {
    strokeWeight(wx*wy);
  } 
  else {
    strokeWeight(50);
  }
  line(0, height/2, width, height/2);
}
