
void setup() {
  size(800, 800);
  frameRate(10);
  smooth();
}

void draw() {
  noStroke();
  fill(random(0,50), random(0,50), random(100,255), random(10,75));
  ellipse(random(width), random(height), random(10,75), random(10,75));
}

void mousePressed() {
  exit();
}

