
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  smooth();
  noFill();
  strokeWeight(1);
  stroke(mouseX/2,mouseY/2,50,100);
  ellipse(mouseX,mouseY,mouseY,mouseX);
}

void mousePressed() {
  background(mouseX/2,mouseY/2,50,100);
}

void keyPressed() {
  background(0);
}

