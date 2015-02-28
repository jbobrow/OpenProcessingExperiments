
Spot[] sp = new Spot[30];
PImage myImage;
/* @pjs preload="http://mathatelle.appspot.com/imgs/drawing_circle.png"; */
  
void setup() {
  size(800, 600);
  imageMode(CENTER);
  myImage = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bubble.png"); //100x100pxの画像を読み込む
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(0.2, 0.5), random(0.1,0.5));
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
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ
  
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
  
  void move() {
    speed *= 1.001;
    y -= speed;
    if (y < - myImage.width*diameter/2) {
      x = random(width);
      y = height + myImage.width*diameter/2;
      speed = random(0.05,2);
      }
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
    tint(255, 255, 0, 180);
    image(myImage, 0, 0);
    popMatrix();
    
    fill(0);
    noStroke();
    rect(0,0,width,100);
  }
}

