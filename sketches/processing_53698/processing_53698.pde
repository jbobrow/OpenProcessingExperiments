
class Circle {

  float x;
  float y;
  float r;
  color c;

  Circle(float x_, float y_, float r_, color c_) {

    x = x_;
    y = y_;
    r = r_;
    c = c_;
  }

  void position (float x_, float y_) {
    x = x_;
    y = y_;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}


