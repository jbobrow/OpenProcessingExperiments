
// saving frames


void setup() {
  size(500, 500);
  background(0);
  strokeWeight(2);
  stroke(255, 64);
}

void draw() {
  line(width/2, height/2, mouseX, mouseY);
}

void mousePressed() {
  saveFrame("frame-######.png");
}
