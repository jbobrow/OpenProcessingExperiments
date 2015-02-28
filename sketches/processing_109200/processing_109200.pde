
void setup() {
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  randomSeed(0);
  for (int x = 50; x < width; x = x + 50) {
    for (int y = 50; y < height; y = y + 50) {
      color datcolor = color(random(360), random(60, 75), random(55, 85));
      if ((x == 250) || (y == 450)) {
        fill(0);
      } 
      else {
        fill(datcolor);
      }
      noStroke();
      ellipse(x, y, 20, 20);
    }
  }
}
