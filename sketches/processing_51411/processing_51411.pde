
void setup() {
  size(500, 500);
  background(255);
  smooth();
}

void draw() {
  fill(pmouseX, pmouseY, mouseX, mouseY);
  stroke(5);
  abs(mouseX-pmouseX);
  ellipse(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed() {
  fill(198,32,143);
  abs(mouseX-pmouseX);
  rect(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  background(255);
}


