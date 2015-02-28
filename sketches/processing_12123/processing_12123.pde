
class Ball {
  int xpos;
  int ypos;
  
  Ball() {
    xpos = int(random(0, width));
    ypos = int(random(0, height));
  }
  
  void move() {
    xpos = xpos + int(random(-2, 2));
    ypos = ypos + int(random(-2, 2));
    if (xpos > width) {
      xpos = width;
    }
    if (xpos < 0) {
      xpos = 0;
    }
    if (ypos > height) {
      ypos = height;
    }
    if (ypos < 0) {
      ypos = 0;
    }
  }
  
  void display() {
    strokeWeight(0);
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
  
  

