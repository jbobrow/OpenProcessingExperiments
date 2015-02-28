
Spot[] sp = new Spot[60];

void setup() {
  size(100, 100);
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(5,30), random(0.5,3));
  }
}

void draw() {
  background(204);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }
}

//Spotクラスを定義
class Spot {
  //属性を定義
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ

  //コンストラクタを定義
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }

  //移動するメソッドを定義
  void move() {
    x += speed;
    if (x > width + diameter/2) x = -diameter/2;
  }

  //表示するメソッドを定義
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}                                                               
