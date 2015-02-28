
//Emma Grapek - Creative Computing - Section B - Week 5

void setup() {
  size(500, 500);
  smooth();
  background(0);
  frameRate(10);
}

void draw() {
  noStroke();
  for (int x = 0; x <= width; x += 5) {
    for (int y = 0; y <= height; y += 5) {

      fill (random(0, 255), random(0, 255), random(0, 255));
      ellipse(x, y, 5, 5);
    }
  }
}

