
float drawmode = 0;

void setup() {
  smooth();
  size (400,400);
  background (0);
}

void draw() {
  if (drawmode > 2) {
    drawmode = 0;
  }
  if (drawmode == 0) {
    stroke (random(255),random(255),random(255));
    line (pmouseX, pmouseY, mouseX, mouseY);
  }
    if (drawmode == 1) {
    noStroke();
    fill (random(255),random(255),random(255));
    ellipseMode(CORNERS);
    ellipse (pmouseX, pmouseY, mouseX, mouseY);
  }
    if (drawmode == 2) {
    noStroke();
    fill (random(255),random(255),random(255));
    rectMode(CORNERS);
    rect (pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseReleased() {
  background (0);
  drawmode += 1;
}

