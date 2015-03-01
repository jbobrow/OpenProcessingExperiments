
void setup() {
  size(500, 500);
  background(0);
  noLoop();
}

void mousePressed() {
  background(0);
  loop();
}

void draw() {
  strokeWeight(1);
  stroke(random(0, 255), 0, random(0, 90));
  line(250, 250, mouseX, mouseY);
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 60, 60);
}





