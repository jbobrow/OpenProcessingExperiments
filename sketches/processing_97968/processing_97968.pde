
void setup() {
  size(400, 400);
  background(0);
  frameRate(5);
}

void draw() {
  for (int i = 0; i < width; i++) {
    float r = random(355);
    stroke(r);
    line(i, 0, i, height);
  }
}



