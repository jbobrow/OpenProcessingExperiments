
int x=10;

void setup() {
  size(200,200);
  background(200);
}
  
void draw() {
}
  
void mousePressed() {
  stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,10,10);
  ellipse(mouseX-x,mouseY,10,10);
  ellipse(mouseX-2*x,mouseY,10,10);
  ellipse(mouseX+x,mouseY,10,10);
  ellipse(mouseX+2*x,mouseY,10,10);
}


