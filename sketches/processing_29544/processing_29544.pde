
// Based on the diagram at the top of this page:
// https://secure.wikimedia.org/wikipedia/en/wiki/Normal_distribution

void setup() {
  size(600, 360);
  smooth();
  noFill();
  strokeWeight(4);
}

void draw() {
  background(255);
  stroke(32, 74, 135);
  drawGaussian(0, .2);
  stroke(210, 32, 32);
  drawGaussian(0, 1.0);
  stroke(200, 141, 0);
  drawGaussian(0, 5.0);
  stroke(78, 154, 6);
  drawGaussian(-2, .5);
}

void drawGaussian(float mean, float variance) {
  beginShape();
  for(int i = 0; i < width; i++) {
    float x = map(i, 0, width, -5, 5);
    float y = Gaussian(x, mean, variance);
    float screenx = map(x, -5, 5, 0, width);
    float screeny = map(y, 0, 1, height, 0);
    vertex(screenx, screeny);
  }
  endShape();
}

float Gaussian(float x, float mean, float variance) {
  return (1 / sqrt(TWO_PI * variance)) * exp(-sq(x - mean) / (2 * variance));
}                               
