
class element {

  // variables **************************************************************
 int x, y;
  float x1, y1, rotation,a ;
  // constructor: color - x - y - x1 - y1 rotation elementNumber 
  element(int tempX, int tempY, float tempX1, float tempY1, float tempRotation, float tempA) {
    x=tempX;
    y=tempY;
    a=tempA;
    rotation=tempRotation;
    x1=tempX1;
    y1=tempY1;
  }

  // display() **************************************************************
  void display() {
    stroke(255,a);
    noFill();
    pushMatrix();
    translate(x,y);
    rotation = atan2(paceY - y, paceX - x);
    rotate(rotation);
    line(0,0,x1,y1);
    popMatrix();
  }
}




























