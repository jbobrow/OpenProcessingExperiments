
//Problem Set 2
//Question 2
//Matthew Iannacci
void setup() {
  size(500,500);
  background(255);
  noStroke();
}

void draw() {
if (mousePressed && (mouseButton==LEFT)) {
  brush(mouseX,mouseY);
}
}
void brush(int x, int y) {
  fill(mouseX,mouseY,150,130);
  ellipse(mouseX,mouseY,100,75);
  ellipse(mouseX,mouseY,75,100);
}
  

