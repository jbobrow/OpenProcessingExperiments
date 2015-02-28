
Drifter[] drifters;

void setup() {
  size(800, 600, P2D);
  drifters = new Drifter[50];
  for (int i = 0; i < drifters.length; i++) {
    drifters[i] = new Drifter(1, random(1, 500));
  }
  background(0);
  stroke(255);
}

void draw() {
  filter(BLUR);
  for (int i = 0; i < drifters.length; i++) {
    float x1 = drifters[i].x;
    float y1 = drifters[i].y;
    for (int j = 0; j < 10; j++) {
      drifters[i].drift();
      set(int(drifters[i].x), int(drifters[i].y), 0xFFFFFFFF);
    }
  }
}


class Drifter {
  float phi, dPhi, ddPhi, x, y, v, f;

  Drifter(float _v, float _f) {
    phi = random(0, TWO_PI);
    v = _v;
    f = 1.0/_f;
    dPhi = random( -QUARTER_PI, QUARTER_PI)*f;
    x = random(0, width);
    y = random(0, height);
  }

  void drift() {
    ddPhi = random( -QUARTER_PI - dPhi, QUARTER_PI - dPhi)*f;
    dPhi += ddPhi;
    phi = (phi + dPhi + 2*TWO_PI) % TWO_PI;
    x = (x + v*sin(phi) + width) % width;
    y = (y + v*cos(phi) + height) % height;
  }
}
