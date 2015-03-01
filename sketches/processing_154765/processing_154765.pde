
Spot[] sp = new Spot[60];
PImage myImage;
/* @pjs preload="http://mathatelle.appspot.com/imgs/drawing_circle.png"; */
 
void setup() {
  size(800, 400);
  imageMode(CENTER);
  myImage = loadImage("http://mathatelle.appspot.com/imgs/drawing_circle.png");
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(0.2,1.0), random(0.1,1.0));
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
  float x, y, diameter, speed;
 
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
 
  void move() {
    speed *= 1.01;
    y += speed;
    if (y > height+myImage.width*diameter/2) {
      x = random(width);
      y = -myImage.width*diameter/2;
      speed = random(0.5,3);
      }
  }
 
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
    //tint(255, 255, 255, 153);
    image(myImage, 0, 0);
    popMatrix();
  }
}
                                                                                                                                                
