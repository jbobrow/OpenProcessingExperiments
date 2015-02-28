
ColorSpot[] sp = new ColorSpot[20];
 
void setup() {
  size(800, 600);
  noStroke();
  smooth();
  colorMode(RGB);
  background(0);
 
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new ColorSpot(
    random(width),
    random(height),
    random(50, 100),
    random(0.5, 1.5),
    color(0, random(150, 200), 255, random(10,150)));
  }
}
 
void draw() {
  background(0);
   fill(0);
 rect(0,0,width,100);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }
   
 
for (int i = 0; i < 10; i++) {
    fill(random(0, 20), random(150, 255), 255, 20);
    noStroke();
    ellipse(random(width), random(110), 20, 20);
    ellipse(random(width), random(100), 15, 15);
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
    stroke(0, random(150, 255), 255, random(10,80));
    strokeWeight(random(0.5,1.5));
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

