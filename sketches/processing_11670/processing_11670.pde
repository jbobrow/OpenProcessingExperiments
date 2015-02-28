
void setup() {
  size(500, 500);
  background(7, 27, 54);
  smooth();
}

void draw() {
  noStroke();
  fill(mouseX, 0, mouseY);
  ellipse(mouseX, mouseY, 1, 1.5);
  rect(50, 300, 40, 200);
  rect(0, 350, 45, 200);
  rect(100, 400, 50, 100);
  rect(200, 400, 40, 100);
  rect(250, 350, 40, 150);
  rect(250, 350, 60, 150);
  rect(350, 350, 60, 150);
  rect(410, 200, 80, 300);
  smooth();

}

void mousePressed() {
  noStroke();
  ellipse(mouseX, mouseY, 5, 5);
}

