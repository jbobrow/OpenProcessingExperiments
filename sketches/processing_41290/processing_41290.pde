
int xStart; // starting point x axis
int yStart;  // starting point y axis
int diamX;  // x axis diameter of ellipse
int diamY;  // y axis diameter of ellipse

void setup() {
  size(800, 800);
  smooth();
  xStart = 400;
  yStart = 400;
  diamX = 280;
  diamY = 40;
}

void draw() {
  background(0);
  strokeWeight(6);
  stroke(0, 218, 174, 150);
  for (float i = 0; i < 20; i++) {
    pushMatrix();
    noFill();
    translate(xStart, yStart);
    rotate(radians(i*mouseY));
    stroke(0, 218/i, 174/i);
    ellipse(mouseX, 0, diamX, diamY);
    popMatrix();
  }
}

