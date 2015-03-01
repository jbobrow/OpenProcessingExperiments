
float c1, c2;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  
  c1 = map(mouseX, 0, width, 100, 255);
  c2 = map(mouseY, 0, width, 255, 100);
  fill(c1, 150);
  stroke(c2);
  strokeWeight(4);
  ellipse(width - mouseX, height - mouseY, 200, 200);
  ellipse(width - mouseY, height - mouseX, 200, 200);
  ellipse(mouseX, mouseY, 200, 200);
  ellipse(mouseY, mouseX, 200, 200);
}

