
void setup() {
  size(500, 500);
}


void draw() {
  background(0);
  noStroke();
  fill(mouseX/2, mouseX);
  ellipse(width/2, height/2, mouseX-250, height/1.5);
  fill(mouseY/2, mouseY);
  ellipse(width/2, height/2, height/1.5, mouseY-250);
}
