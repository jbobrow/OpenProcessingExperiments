
void setup() {
  size(500,500);
  background(0);
}

void draw() {
}

void mousePressed() {
  noStroke();
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,100,100);
}
 void keyPressed() {
   fill(mouseX,mouseY,mouseX,50);
   
}

