
void setup() {
  size(480, 640);
  smooth();
  background(255);
}


void draw() {
  line(width/2, height/2, mouseX, mouseY);
  fill(mouseX, mouseY);
  ellipse(mouseX, mouseY, 50, 50);
  ellipse(width/2, height/2, 200, 200);
  fill(mouseX, mouseY);
  smooth();
}




