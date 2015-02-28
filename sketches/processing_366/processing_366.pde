
void setup() {
  size(350, 500);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  fill(20);
  ellipse(125, 110, 70, 100);
  ellipse(225, 110, 70, 100);
  fill(100);
  triangle(145, 320, 175, 160, 190, 295);
  fill(150);
  rect(90, 350, 175, 10);
  fill(230);
  triangle(120, 400, 170, 450, 220, 400);
}

