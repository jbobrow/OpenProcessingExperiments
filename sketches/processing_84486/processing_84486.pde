

class Slopes {
  float s0;
  float s1;

  Slopes( float s0, float s1 ) {
    this.s0 = s0;
    this.s1 = s1;
  }
};


class Node {
  float x;
  float y;
  float dx;
  float dy;
    
  Node (float px, float py) {
    x = px;
    y = py;   
    dx = 0.01f + random(0.9f);
    if ( random(1) > 0.5f )
      dx *= -1;
    dy = 0.01f + random(0.9f);
    if ( random(1) > 0.5f )
      dy *= -1;
  }
  
  void move() {
    x += dx;
    y += dy;
    if ( x < 0 ) {
      x = 0;
      dx *= -1;
    } else if ( x > width ) {
      x = width;
      dx *= -1;
    }
    if ( y < 0 ) {
      y = 0;
      dy *= -1;
    } else if ( y > height ) {
      y = height;
      dy *= -1;
    }
  }
  
};


