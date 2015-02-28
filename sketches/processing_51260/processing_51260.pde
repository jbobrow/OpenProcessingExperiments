
class Ball {

  float x, y;
  float speedY = random(-4, -2);
  float r = 20;

  Ball(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void display() {
    noStroke();
    fill(3, 255, 29);
    ellipse(x, y, r*2, r*2);
  }

  void move(float speed_) {
    x += speed_;
    y += speedY;

    if ( y + r > height || y - r < 0) {
      speedY *= -1;
    }
  }

  boolean outRight() {
    if (x - r > width) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean outLeft() {
    if (x + r < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}


