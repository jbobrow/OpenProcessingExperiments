
class Rotater {
  
  float x,y;
  float theta;
  float speed;
  float w;
  
  Rotater (float tempX, float tempY, float tempSpeed, float tempW) {
    x = tempX;
    y = tempY;
    theta = 2;
    speed = tempSpeed;
    w = tempW;
  }
  
  void spin () {
    theta += speed;
  }
  
  void display () {
    rectMode (CENTER);
    stroke (3);
    fill (0,100);
    pushMatrix ();
    translate (x,y);
    rotate (theta);
    ellipse (3,3,w,w);
    popMatrix ();
  }
}

