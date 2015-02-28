
class Catcher {

  float x, y;
  float r;

  Catcher(float r_) {

    x = 0;
    y = 0;
    r = r_;
  }

  void setLocation(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void display() {
    fill(255,0,0);
    ellipse(x, y, r*2, r*2);
  }
}


