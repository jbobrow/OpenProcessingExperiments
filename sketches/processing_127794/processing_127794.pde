
void setup() {
  size(500,300);
}

void draw() {  
  background(mouseX, mouseY, 239);
  beginShape();
  vertex(35, 17);
  vertex(18, 35);
  vertex(71, 107);
  vertex(125, 35);
  vertex(108, 17);
  vertex(35, 17);
  endShape(CLOSE);
  
  fill(mouseX, mouseY, 40);
  ellipse(38,36,10, 10);
  ellipse(103,36,10, 10);
  arc(70, 70, 30, 30, PI, TWO_PI);
  
}


