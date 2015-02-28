
Drifter[] drifters;

void setup() {
  size(800, 600);
  drifters = new Drifter[500];
  for (int i = 0; i < drifters.length; i++) {
    drifters[i] = new Drifter(1, random(10, 5000));
  }
  background(0);
  stroke(255);
}

void draw() {
  //filter(BLUR);
  background(0);
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
  float x, y, dx, dy, ddx, ddy, v, f;

  Drifter(float _v, float _f) {
    v = _v;
    f = 1.0/_f;
    x = random(0, width);
    y = random(0, height);
    dx = v*random(-1, 1);
    dy = v*random(-1, 1);
    ddx = f*random(-1, 1);
    ddy = f*random(-1, 1);
  }

  void drift() {
    ddx = random( -10 - dx, 10 - dx)*f;
    dx += ddx;
    ddy = random( -10 - dy, 10 - dy)*f;
    dy += ddy;
    x = (x + v*dx + width) % width;
    y = (y + v*dy + height) % height;
  }
}
