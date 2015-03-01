
// Nervous Waves 2
// Levente Sandor, 2014


void setup() {
  size(500, 500);
  fill(#0B610B);
  noStroke(#81F7BE);
 rectMode(CORNER);
  frameRate(880);
  noiseDetail(0, 0.9);
}

void draw() {
  background(255);
  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(10 * n);
      rect(0, 60, 1, 1);
      popMatrix();
    }
  }
  
}
