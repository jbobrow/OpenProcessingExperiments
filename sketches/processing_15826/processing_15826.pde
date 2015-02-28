
Spot sp1, sp2; //オブジェクトを宣言

void setup() {
  size(100, 100);
  sp1 = new Spot(25, 50, 30, 1); //sp1 を生成
  sp2 = new Spot(75, 80, 10, 3); //sp2 を生成
}

void draw() {
  background(204);
  sp1.move();
  sp2.move();
  sp1.display();
  sp2.display();
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
