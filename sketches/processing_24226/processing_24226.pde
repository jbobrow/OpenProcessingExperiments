
// Catcher - a object to represent the user controlled circle
// used the catch the drops.
class Catcher {
  float x, y; // location
  float r;    // radius
  
  Catcher( float radiusValue ) {
    x = 0.0;
    y = 0.0;
    r = radiusValue;
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(x,y,r*2,r*2);
  }
  
  void setLocation( float tempX, float tempY ) {
    x = tempX;
    y = tempY;
  }
  
  boolean intersect( float cx, float cy, float cr ) {
    float distance = dist( x, y, cx, cy );
    if (distance < (r + cr)) {
      return true;
    }
   
    return false;

  }
}

