


void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(255);
  for (int x = 10; x < width; x += 15) {
    float mx = mouseX / 10;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    line(x + offsetA, 20, x - offsetB, 480);
    stroke(252,25,33);
  }
}


