
//Problem Set 2
//Problem Question 3
//Matthew Iannacci
//Brush size/colour fluctuates based on movement of the mouse
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
  ellipse(mouseX,mouseY,mouseX,mouseY);
  ellipse(mouseX,mouseY,75,100);
  
}
  

