
void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
 
  line(pmouseX, pmouseY, mouseX, mouseY);
}
