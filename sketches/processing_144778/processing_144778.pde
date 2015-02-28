
int dist = 75;

void setup() {
  size(500, 500);
  smooth();
  frameRate(8);
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  for (int i = 25; i < width; i+=dist) {
    for (int j = 25; j < height; j+=dist) {
      rectMode(CENTER);
    ellipse(i, j, random(20), random(20));
    }
  }
  fill(0);
  for (int i = 25; i < width; i+=dist) {
    for (int j = 25; j < height; j+=dist) {
      rectMode(CENTER);
    ellipse(i, j, random(10), random(10));
    }
  //saveFrame("image-####.gif");
}
}

