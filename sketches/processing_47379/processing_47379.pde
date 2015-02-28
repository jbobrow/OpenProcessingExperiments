
void setup() {
  size(500, 500);
  smooth();
  background(0);
  stroke(31, 137, 222);
  noFill();
}

void draw() {
  float x = random(width);
  float y = random(height);

  float s = random(20, 50);
  //fill(0, 255, 0, 127); // Grüne, halbtransparente Kreise
  ellipse(x, y, s, s);
}

