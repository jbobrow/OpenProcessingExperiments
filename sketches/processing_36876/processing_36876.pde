
void setup() {
  size(100, 100);
  background(0);
  frameRate(60);
  smooth();
}

void draw() {
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(50, 50, random(width), random(height));
}

