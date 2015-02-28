
Spot[] sp = new Spot[60];


void setup() {
  size(480, 360);
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(10,30), random(44, 84), random(0.5, 1));
  }
}


void draw() {
  background(0);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }
}


class Spot {
  float x, y, s, c, speed; // x座標, y座標, 文字サイズ, 文字色, 速さ

  Spot(float _x, float _y, float _s, float _c, float _speed) {
    x = _x;
    y = _y;
    s = _s;
    c = _c;
    speed = _speed;
  }

  void move() {
    x -= speed;
    if (x < 0 - s * 2) x = width;
  }

  void display() {
    textSize(s);
    fill(c);
    text("zzz...", x, y);
  }
}
                                
