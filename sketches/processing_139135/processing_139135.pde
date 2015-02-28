


void setup() {
  size(500, 500);
  background(255); 
}

void draw() {
  translate(width/2, height/2);
  ellipseMode(CENTER);
  fill(mouseX/2, mouseY/2, 50);
  noStroke();
  ellipse(mouseX/2, mouseY/2, 50, 50);
  ellipse(-mouseX/2, -mouseY/2, 50, 50);
  ellipse(mouseY/2, mouseX/2, 50, 50);
  ellipse(-mouseY/2, -mouseX/2, 50, 50);
  ellipse(mouseX/2, -mouseY/2, 50, 50);
  ellipse(-mouseX/2, mouseY/2, 50, 50);
  ellipse(-mouseY/2, mouseX/2, 50, 50);
  ellipse(mouseY/2, -mouseX/2, 50, 50);
}



