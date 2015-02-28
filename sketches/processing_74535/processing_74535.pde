
void setup () {
  size(500, 500);
}

void draw() {   
  colorMode(HSB, 500);
  background(0, 0, mouseX+mouseY/2);
  for (int y = 40; y < height-50; y = y + 50) {
    for (int x = 40; x < width-50; x = x + 50) {

      colorMode(HSB, 900);
      fill(x+y/2-60, 900, 900);
      noStroke();
      rect (x, y, 15, 15);
    }
  }
}
