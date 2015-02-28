
void setup() {
  size (200, 200);
  noStroke();
  noLoop();
}

void draw() {
  liq (random(10, 15),random(20, 30), random(100, 180));
}

void liq(float power, float d, float op) {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float total = 0.0;
      for (float i = d; i >= 1; i = i/3) {
        total += noise(x/d, y/d) * d;
      }
      
      float turbulence = 128.0 * total /d;
      float base = (x * 0.12) + (y * 0.12);
      float offset = base + (power * turbulence / 256.0);
      float gray = abs(sin(offset)) * 256.0;
      stroke (gray, op);
      point (x, y);
    }
  }
}
