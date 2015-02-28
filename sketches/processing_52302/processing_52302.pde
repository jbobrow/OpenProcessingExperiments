
/**
 * Dharmatech, LLC
 * oss@dharmatech.org
 */

class Ball {

  int rad;
  int x;
  int y;
  float angle;
  int speed;
  int yincr;
  int xincr;
  boolean _bounced;

  Ball(int r) {
    rad = r;
    x = int(random(0,width));
    y = 0;
    speed = 1;
    yincr = speed + 1;
    xincr = speed;
    _bounced = false;
  }
  
  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
  
  void setAngle(float a) {
    xincr = ceil(int(a));
  }
  
  void vbounce() {
    if (!_bounced) { _bounced = true; }
    yincr = -yincr;
  }
  
  void hbounce() {
    xincr = -xincr;
  }
  
  boolean hasBounced() {
    return _bounced;
  }
  
  void display() {
    noStroke();
    fill(#508035);
    ellipse(x, y, rad * 2, rad * 2);
    
    y += yincr;
    if (y < 0) {
      y = 0;
      yincr = speed + 1;
    }
    
    x += xincr;
    if (x < 0) {
      x = 0;
      if (xincr < 0) {
        xincr = abs(xincr);
      }
    } else if (x > width) {
      x = width;
      xincr = xincr * -1;
    }
  }
}

