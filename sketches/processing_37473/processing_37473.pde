
Spot[] sp = new Spot[50];

/* @pjs preload="http://mathatelle.appspot.com/imgs/drawing_circle.png"; */
  
void setup() {
  size(800, 600);
  colorMode(RGB,255);
  smooth();
  noStroke();
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(
    random(width), 
    random(height), 
    random(0.2,1.0), 
    random(0.1,1.0));
  }
}
  
void draw(){
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
    if (y < - width*diameter/2) {
      x = random(width);
      y = height + width*diameter/2;
      speed = random(0.5,3);
      }
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
    //tint(255, 255, 255, 153);
    fill(0, random(50, 80), random(200, 255));
    ellipse(0,0,random(80,82),random(82,82));
    popMatrix();
  }
}

