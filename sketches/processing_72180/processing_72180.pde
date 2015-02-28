
class Ball {

  float x;
  float y;
  float xvelocity;
  float yvelocity;
  float radiusBall;
  float ballSize;
  float R = random (50, 150);
  float G = random (75, 150);
  float B = random (125, 150);




  Ball (float xpos, float ypos, float bsize) {
    x = xpos;
    y = ypos;
    ballSize = bsize;

    xvelocity = random (-10, 10);
    yvelocity = random (-10, 10);
  }


  void update () {
    x += xvelocity;
    y += yvelocity;
  }

  //bounce off the boundaries

  void checkCollision () {

    float r = radiusBall/2;

    if (x <= r || x >= width - r) {
      xvelocity = -xvelocity;
    }

    if (y <= r || y >= height - r) {
      yvelocity = -yvelocity;
    }
  }

  void drawBall () {
    fill (R, G, B);
    ellipse (x, y, random (ballSize), random (ballSize));
  }
}


