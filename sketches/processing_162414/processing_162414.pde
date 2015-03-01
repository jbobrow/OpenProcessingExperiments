
void setup() {
  size(400, 400);
  background(125,45,225);
  noFill();
  smooth();
}
void draw() {
  if (random(100) > 50) {
    stroke(125);
  } else {
    stroke();
  }
  float r = random(100);
  ellipse(200, 200, r, r);
  copy(0, 0, width, height, -3, -2, width + 5, height + 3);
}
