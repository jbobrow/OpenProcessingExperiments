
class JitterBug {
  float x;
  float y;
  int diameter;
  float easing   = 0.03;
  float speed = 30;

  
  JitterBug(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }
  
  void move() {
    x += random(-speed/2, speed/2);
    y += random(-speed/2, speed/2);
  }
  
  void display() {
    //fill(random(255), random(255), random(255));
     fill(70, 160, 200, 200);
     stroke(200, 160, 70);
     float targetX = mouseX;
     x += (targetX - x) * easing;
     float targetY = mouseY;
     y += (targetY - y) * easing;
     ellipse(x, y, diameter, diameter);
    
  }
}

