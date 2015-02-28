
float actualX = 0;
float actualY = 0;

void setup() {
  size(600, 600);
  noStroke();
  smooth();
  fill(255, 255, 0);
}

void draw() {
  background(100);
  actualX = actualX + (mouseX - actualX) * .1;
  actualY = actualY + (mouseY - actualY) * .1;
  ellipse(actualX, actualY, 100, 100);
}


