
void setup() {
  size(2880, 1800);
  stroke(128, 128, 0);
  strokeWeight(8);
}

void draw() {
  background(0, 0, 255);
  float x = mouseX;
  float y = mouseY;
  triangle(x, y, x + 10, y + 20, x + 40, y);
  rect(x, y, x + 20, y - 30);
  fill(255, 165, 0);
}


