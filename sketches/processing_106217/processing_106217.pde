
int ROWS = 40;
int COLS = 40;

float distort(float f, float g) {
  return (f < 0.5) ? map(f, 0, 0.5, 0, g) : map(f, 0.5, 1, g, 1);
} 

void setup() {
  size(400, 400);
  colorMode(RGB, 1);
}

void draw() {
  float t = millis() * 1e-3;
  float dx = float(width) / COLS;
  float dy = float(height) / ROWS;
  noStroke();
  for (int i = 0; i < ROWS; i++) {
    float v = 2 * float(i) / ROWS;
    for (int j = 0; j < COLS; j++) {
      float u = 20 * float(j) / COLS;
      float cR = distort(noise(u - t, v - t, 0 - t), norm(mouseX, 0, width));
      float cG = distort(noise(v - t, 0 - t, u - t), norm(mouseX + mouseY, width + height, 0));
      float cB = distort(noise(0 - t, u - t, v - t), norm(mouseY, 0, height));
      fill(cR, cG, cB);
      rect(j * dx, i * dy, dx, dy);
    }
  }
}
