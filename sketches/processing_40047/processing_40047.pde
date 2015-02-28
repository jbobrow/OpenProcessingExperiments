
class Catcher {
  float r;
  float x,y;
  
  Catcher (float tempR) {
    r = tempR;
    x = 0;
    y = 0;
  }
  
 void setLocation (float tempX, float tempY) {
 x = tempX;
 y = tempY;
}

void display() {
  noStroke();
  fill(175);
  ellipseMode(CENTER);
  ellipse(x,y,r*2,r*2);
}

 
 boolean intersect(Drops d) {
  float distance = dist(x,y,d.x,d.y);
  if (distance < r + d.r) {
    return true;
  } else {
    return false;
  }
 }
}



