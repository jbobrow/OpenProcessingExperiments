
float s = 30;
float g = 0.1;
float a = 1.0;
float gs = 2.5;

class Star {
  float x;
  float y;
  float vx;
  float vy;

  void init(float w, float h) {
    x = random(0, w);
    y = random(0, h);
    vx = random(-gs, gs);
    vy = random(-gs, gs);
  }

  void draw() {
    ellipse(x, y, s, s);
  }

  void update() {
    vy += g;
    x += vx;
    y += vy;

    if (y < 0) {
      y = 0;
      vy = -a * vy;
    }
    else if (y > height) {
      y = height;
      vy = -a * vy;
    }
    if (x < 0) {
      x = 0;
      vx = -a * vx;
    }
    else if (x > width) {
      x = width;
      vx = -a * vx;
    }
  }

  void spreading() {
  }
};

int n = 400;
Star [] stars;

void setup()
{
  size(800, 600);
  smooth();
  stars = new Star[n];
  for (int i=0;i<n;i++) {
    stars[i] = new Star();
    stars[i].init(width, height);
  }
  noStroke();
  fill(0, 0, 255, 100);
}

void draw() {
  background(255);
  for (int i=0; i<n; i++) {
    if (mousePressed)
      stars[i].spreading();
    else
      stars[i].update();
    stars[i].draw();
  }
}


