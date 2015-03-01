
// Doodle
// Levente Sandor, 2014

float sX = 1;
float sY = 1;
float x = 250;
float y = 250;

void setup() {
  size(500, 500);
  background(255);
  fill(255, 20);
  stroke(0, 20);
}

void draw() {
  if (frameCount % 500 == 0) {
    rect(-1, -1, width + 1, height + 1);
  }
  for (float a = 0; a < TWO_PI; a += 0.02) {
    pushMatrix();
    translate(x, y);
    rotate(a);
    float r = 500 * pow(noise(cos(a), sin(a), frameCount * 0.01), 4);
    translate(r, r);
    line(0, 0, 0, 0);
    popMatrix();
  }
  x += sX;
  y += sY;
  if (x < 0 || x > width || random(1) < 0.003) {
    sX = -sX;
  }
  if (y < 0 || y > height || random(1) < 0.003) {
    sY = -sY;
  }
}

