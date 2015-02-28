
//templete of Ball
class Ball {

  float x;
  float y;

  float w;
  float h;

  float xVel;
  float yVel;

  float r, g, b;

  void setupBall(int n) {

    x = random(width);
    y = random(height);

    w = random(10, 50);
    h = random(10, 50);

    r = random (255);
    g = random (255);
    b = random (255);

    if (n == 0) {
      xVel = random(-1, 1);
      if (random(50)<25) {
        xVel *= -1;
      }
    }
    if (n==1) {
      xVel = random(2);
      if (random(50)<25) {
        xVel *= -1;
      }
    }
    if (n==2) {
      xVel = random(4);
      if (random(50)<25) {
        xVel *= -1;
      }
    }
  }

  void updateBall() {
    x +=xVel;
    y +=yVel;

    if (x<0 || x>width) {
      xVel *=-1;
    }
    if (y<0 || x>height) {
      yVel *=-1;
    }
  }

  void drawBall() {
    fill(r, g, b);
    ellipse(x, y, w, h);
  }
}


