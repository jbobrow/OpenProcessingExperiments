
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  
  smooth();
  noStroke();
  fill(mouseX,mouseY,mouseX);
  rectMode(CENTER);
  ellipse(mouseX,mouseY,80,80);
}

