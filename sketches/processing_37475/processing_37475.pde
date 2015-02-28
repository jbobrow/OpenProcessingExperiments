
ColorSpot[] sp = new ColorSpot[20];

void setup() {
  size(800, 600);
  noStroke();
  smooth();
  colorMode(RGB);
  frameRate(60);

  for (int i = 0; i < sp.length; i++) {
    sp[i] = new ColorSpot(
    random(width), 
    random(height), 
    random(40, 90), 
    random(0.5, 2), 
    color(0, random(50, 80), random(200, 255), random(30, 100)));
  }
}

void draw() {
   println(frameCount);
  background(0, 0, 50);
  fill(0);
  rect(0,0,width,100);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }

  for (int i = 0; i < 1; i++) {
    fill(random(0, 20), random(80, 100), 255, 30);
    noStroke();
    ellipse(random(width), random(110), random(10, 30), random(10, 30));
    ellipse(random(width), random(100), 20, 20);
  }
 
}


//Spotクラスを定義
class Spot {
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ
 
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
 
  //移動するメソッドを定義
  void move() {
    y -= speed;
    if (y < -diameter/2)
    y = height + -diameter/2;
    
  }
 
  //表示するメソッドを定義
  void display() {
    stroke(0, random(80, 100), 255, random(10, 80));
    strokeWeight(random(0.5,1.5));
   ellipse(x , y, diameter, diameter);
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

