
class Cars {
  float x, y;
  float d, t;
  boolean moving = false;

  Cars(float _x, float _y, float _d, float _t) {
    x = _x;
    y = _y;
    d = _d;
    t = _t;
  }

  void drawCars() {
    fill(0);
    ellipse(x, y, d, t);
    fill(255);
    ellipse(x-5, y+5,15,15);
    ellipse(x+5, y-10,15,15);
   
  }
  void CarKey() {

    fill(random(255),random(255),random(255));
    ellipse(x, y, d, t);
  }
}



