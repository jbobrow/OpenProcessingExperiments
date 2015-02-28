
void setup() {
  size(500,500);
}

void draw() {
  background(255);
  
  stroke(255, 255, 0);
  fill(255, 255, 0);
  ellipse(250, 250, 400, 400);
  
  stroke(0);
  fill(0);
  ellipse(175,175,25,75)
  
  stroke(0);
  fill(0);
  ellipse(500-175,175,25,75)
  
  stroke(0);
  fill(0);
  ellipse(250, 300, abs(-250+mouseX)*2, abs(-300+mouseY)*2);
  
}
