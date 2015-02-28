
class JitterBug {

  float x;
  float y;
  color c;
  int diameter;
  float speed = 5;

  JitterBug(float tempX, float tempY, int tempDiameter, color c1) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    c = c1;
  }

  void move() {
    x += random(-speed, speed);
    y += random(-speed, speed);
  }

  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  } 

}


