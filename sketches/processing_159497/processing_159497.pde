
int s = 10;

void setup() {
  size(380, 240);
  noFill();
  colorMode(HSB, 100);
}

void draw() {
}

void mousePressed() {
  background(0, 3, 95);
  for (int i = 0; i < 10; i += 1) {
    float x = random(width);
    float y = random(height);
    float theta = random(0, PI);
    float scl = random(0.5, 10);
    //strokeWeight(10*i/30);
    stroke(0, 5, 50, 30);
    penta(x+s, y+s, theta, scl);
    stroke(random(100), 90, 90);
    penta(x, y, theta, scl);
  }
}

void penta(float x, float y, float theta, float scl) {
  beginShape();
  pushMatrix();
  translate(x, y);
  rotate(theta);
  scale(scl);
  vertex(-12, -3);
  vertex(0, -12);
  vertex(12, -3);
  vertex(6, 9);
  vertex(-6, 9);
  vertex(-12, -3);
  endShape();
  popMatrix();
}

