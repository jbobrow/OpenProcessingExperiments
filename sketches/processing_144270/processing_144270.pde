
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  noSmooth();
  ellipseMode(CORNER);
  
  stroke(255, 240, 0);
  fill(255, 240, 0);
  ellipse(40, 50, 420, 400);
  
  stroke(0);
  fill(0);
  ellipse(265,100,75,75)
  
  stroke(0);
  fill(0);
  ellipse(160,100,75,75)
  
  stroke(0);
  fill(0);
  ellipse(125, 200,(-125+mouseX),(-200+mouseY));
  
}
