
class Ball {                  // creating a template for this new data type
  float x;
  float y;

  float w;
  float h;

  float r, g, b;
  int o;

  float xVel;                     // now you can make every ball have an x and y velocity
  float yVel;

  void setupBall(int n) {         // gives the properties values
    x = random(width);
    y = random(height);

    w = random(10, 50);
    h = random(10, 50);

    r = random(255);
    g = random(255);
    b = random(255);
    o = 90;

    xVel = random(-3, 3);
    yVel = random(-3, 3);

    if (n == 0) {
      xVel = random(2);
      if (random(50) < 25) {      // this kinds of hacks probability to give you a 50% chance it'll reverse
        xVel*=-1;
      }
    }
    if (n == 1) {
      xVel = random(2, 4);
    }
    if (n == 2) {
      xVel = random(4, 6);
    }
  }

  void updateBall() {
    x += xVel;
    y += yVel;

    if (x < 0 || x > width) {
      xVel*=-1;
    }
    if (y < 0 || y > height) {
      yVel*=-1;
    }
  }

  void drawBall() {
    fill(r, g, b, o);
    ellipse(x, y, w, h);
  }
}


