
void setup() {
  size(400, 400, P2D);
  smooth(4);
  colorMode(HSB);
}


void draw() {
  background(255);
  
   noStroke();
  fill(random(255), 240, 250, 255);
  ellipse(mouseX, mouseY, 100, 100);
  
  noStroke();
  fill(255);
  for (int y = 0; y <= height; y = y + 25) {
    for (int x = 0; x <= width; x = x + 25) {
      ellipse(x, y, 20, 20);
    }
  }

}
