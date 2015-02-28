
void setup() {
  size(300, 300);
  fill(255, 100, 0);
  smooth();
  noStroke();
}

void draw() {
  fill(255,0,0);
  ellipse(random(width), random(height), 15, 15);
}

