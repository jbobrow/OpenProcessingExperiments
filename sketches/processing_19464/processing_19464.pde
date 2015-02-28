
void setup() {
  size(600, 600);
  stroke(0);
  smooth();
  background (255);
  colorMode (RGB, 600);
}

int CARsize = 15;


void draw() {

  for (int i = 15; i < 600; i+= CARsize + 2) {
    CAR (i, height/2 + random(-100, 100), CARsize);
  }
}

void CAR (float x, float y, float z) {

  for (int i = 1; i < 15; i++) {
    noStroke();
    fill(mouseY, x, mouseX, 300);
    ellipse (x, y, z, z);
    fill(mouseY, y, mouseX, 300);
    rectMode(CENTER);
    rect (x, y, z, z);
  }
}

