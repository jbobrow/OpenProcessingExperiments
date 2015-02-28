
class MovingCircle {

  float x;
  float y;
  float xSpeed;
  float ySpeed;

  float circleSize;

  float c1;
  float c2;
  float c3;

  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;

    xSpeed = random(-10, 10);
    ySpeed = random(-10, 10);
  }

  void update() {
    x += xSpeed;

    y += ySpeed;
  }

  void checkCollisions() {

    float r = circleSize/2;

    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    } 

    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawCircle() {
    c1 = 10+y/2;
    c2 = 100+ x/50;
    c3 = map(sin(.2), -1, 1, 0, 255);

    fill(c1, c2, c3);
    ellipse(x, y, circleSize, circleSize);
  }
}

