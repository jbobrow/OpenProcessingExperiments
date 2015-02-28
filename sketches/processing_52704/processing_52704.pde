
class Moth{
  PImage luna;
  float x,y;
  boolean touch = false;
  
  Moth(float tempX, float tempY){
   luna = loadImage ("LunaMoth.png");
   x = tempX;
   y = tempY;
  }
  
  void display(float tempY) {
    y = tempY;
    image(luna,x,y);
  }
}

