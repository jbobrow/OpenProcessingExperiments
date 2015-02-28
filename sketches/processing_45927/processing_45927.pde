
class Sqr {
  float x;
  float y;
  float girth;
  float ogirth;
  float shade;

  Sqr() {
    x = 0;
    y = 0;
    ogirth = 0;
    girth = 0;
  }

  void display() {
    rect(x, y, girth, girth);
  }
  void calculate() {
    int n = int(random(0, 2));
    if (n == 1) {
      girth = ogirth/2;
    }
    if (n == 0) {
      girth = ogirth*2;
    }
  }
}


