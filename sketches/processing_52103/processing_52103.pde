
void setup() {
  size(400, 400);
  strokeWeight(20);
  smooth();
}

void draw() {
  background(204);
  stroke(255);
  ellipse(120, 60, mouseX, mouseY);  // White line
  stroke(0);
  float mx = map(mouseX, 0, width, 60, 180);
  line(120, 60, mx, mouseY);  // Black line
  line(120, 60, mx, mouseX);  //Second Black line
  
}


