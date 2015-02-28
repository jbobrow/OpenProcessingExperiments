
// Learning Processing Exercise 13-5. Spirilitis.

float r = 0;
float theta = 0;

void setup() {
  size(200, 200);
  background(200);
}

void draw() {
  float x = r * cos(theta);
  float y = r * sin(theta);
  noStroke();
  fill(150);
  ellipse(x + width / 2, y + height / 2, 16, 16);
  theta += 0.01;
  r += 0.05;
}
