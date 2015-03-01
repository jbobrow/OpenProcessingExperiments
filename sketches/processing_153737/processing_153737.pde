
// Nervous Waves
// Levente Sandor, 2014

void setup() {
  size(500, 500);
  frameRate(30);
}

void draw() {
  background(467
  );
  for (int x = 0; x < width; x += 18
  ) {
    for (int y = 0; y < height; y += 5) {
      if (int(noise(x * 0.001, y * 0.001, frameCount * 0.01) * 100) % 2) {
        set(x, y, color(255));
      }
    }
  }
}
