
void setup() {
  size(700,700);
  background(0);
}
 
void draw() {
  smooth();
  noFill();
  strokeWeight(1);
  stroke(mouseX/3,mouseY/3,80,180);
  ellipse(mouseX,mouseY,mouseY,mouseX);
}
 
void mousePressed() {
  background(mouseX/3,mouseY/3,50,110);
}
 
void keyPressed() {
  background(0);
}

