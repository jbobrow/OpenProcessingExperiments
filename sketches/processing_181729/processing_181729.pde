
void setup() {
  size(500, 500);  
  background(0);
}

void draw() {
  stroke(255);
  line(0, 0, mouseX, mouseY);
  stroke( mouseX/2 );
  line(0, 0, mouseX, mouseY);
  stroke( mouseY/2 );
  line(0, 0, mouseX, mouseY);
}

void mousePressed() {
  stroke(mouseY/2);
  fill(mouseX/2);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 5, 5);
}



