
class Star {
  float x;
  float y;
  float d;
  float r, g, b;
  float xVel;

  void setupStar() {
    x = random(-10000, -400);
    y = random(-400, 400);
    d = random(1, 4);
    r = 255;
    g = 255;
    b = 255;
    xVel = random(0.5, 1.5);
  }

  void moveStar() {
    x += xVel;
  }

  void drawStar() {
    stroke(r, g, b);
    fill(r, g, b);
    ellipse(x, y, d, d);
  }
}


