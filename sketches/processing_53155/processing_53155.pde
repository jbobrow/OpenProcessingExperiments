
void setup() {
  size(480, 480);
  strokeWeight(1);
  smooth();
  stroke(0);
}

void draw() {
  background(200);
  for (int y = 0; y < height+45; y += 40) {
    for (int x = 0; x <= width; x += 40) {
      line(mouseX, mouseY, x, y);
    }
  }  
}
