
// Learning Processing Exercise 13-8. Moving a noisy wave.

float noiseIndex = 0.0;

void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  noiseIndex += 0.02;
  noStroke();
  fill(0);
  float x = noiseIndex;
  for (int i = 0; i <= 40; ++i) {
    float y = noise(x) * height;
    ellipse(i * 10, y, 16, 16);
    x += 0.2;
  }
}
