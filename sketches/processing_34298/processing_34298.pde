
ColorSpot[] sp = new ColorSpot[30];

void setup() {
  size(1000, 800);
  noStroke();
  smooth();
  colorMode(RGB);
  background(150, 0, 150);

  for (int i = 0; i < sp.length; i++) {
    sp[i] = new ColorSpot(
    random(width), 
    random(height), 
    random(80, 120), 
    random(0.5, 3), 
    color(255,255,255,random(10,150)));
  }
}

void draw() {

  background(255, 100, 255);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }


  for (int i = 0; i < 10; i++) {
    fill(255, random(100, 255), 255, 100);
    noStroke();
    ellipse(random(width), random(height), 30, 30);
    ellipse(random(width), random(height), 40, 40);
  }
}


void mousePressed() {
  ellipse(mouseX, mouseY, 70, 70);
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
    y += -speed;
    if (y < -diameter) y = height + -diameter/2;
  }

  //表示するメソッドを定義
  void display() {
    ellipse(x, y, diameter, diameter);
  }
}

//Spotクラスを継承し、ColorSpotクラスを定義
class ColorSpot extends Spot {
  //属性を定義
  color col; // 色

  //コンストラクタを定義
  ColorSpot(float _x, float _y, float _diameter, float _speed, color _col) {
    super(_x, _y, _diameter, _speed); //親クラス(Spot)のコンストラクタを呼びだす
    col = _col;
  }

  //移動するメソッドを定義
  void move() {
    super.move(); //親クラス(Spot)のメソッドを呼びだす
  }

  //表示するメソッドを定義
  void display() {
    fill(col);
    super.display();
  }
}
                
                
