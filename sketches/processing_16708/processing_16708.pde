
class Ha {
  float x, y, s, xx, yy, xxx, yyy;
  Ha(float _x, float _y, float _s, float _xx, float _yy,float _xxx, float _yyy) {
    x = _x;
    y = _y;
    s = _s;
    xx = _xx;
    yy = _yy;
    xxx = _xxx;
    yyy = _yyy;

  }

  void move() {
    y += s;
    if (y > height) y = 0;
    yy += s;
    if (yy > height) yy = 0;
    yyy += s;
    if (yyy > height) yyy = 0;
  }

  void display() {
    tint(23,90,90);
    image(sasa1, x, y);
    image(sasa2, xx, yy);
    image(sasa3, xxx , yyy);

  }
}




