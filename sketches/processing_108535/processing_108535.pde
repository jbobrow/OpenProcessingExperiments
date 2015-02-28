
// Fake Particles
// Levente Sandor, 2013

float b = 0;

void setup() {
  size(900, 400);
  background(255);
  fill(255);
  noSmooth();
}

void draw() {
  noStroke();  
  rect(0, 0, width, height);

  for (int x = 0; x < width; x += 20) {
    for (int y = 0; y < height; y += 20) {
      float a = 4 * noise(x / 300.0, y / 300.0) * TWO_PI + b;
      stroke(0,20);
      strokeWeight(150);
      point(x + 100 * cos(a), y + 100 * sin(a));
    }
  }

  b += 0.02;
}
