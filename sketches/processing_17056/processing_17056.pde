
class Ball {
  float xpos;
  float ypos;
  float speed;
  
  Ball(int tempYpos, float tempSpeed) {
    xpos = int(random(0, width));
    ypos = tempYpos;
    speed = tempSpeed;
  }
  
  void move() {
    xpos = xpos + speed;
    if (xpos > width) {
      speed = speed * -1;
    }
    if (xpos < 0) {
      speed = speed * -1;
    }
  }
  
  void display() {
    fill(0);
    strokeWeight(1);
    ellipse(xpos, ypos, 8, 8);
  }
  
  boolean isNear(Ball k) {
    stroke(int(dist(xpos, ypos, k.xpos, k.ypos)*3.1));
    if (dist(xpos, ypos, k.xpos, k.ypos) < 80) {
      return true;
    }
    else {
      return false;
    }
  }
}
  
  

