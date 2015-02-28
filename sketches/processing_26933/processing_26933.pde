
class Ball {

  float x;
  float y;
  float w;            // Initial width of circle (Use for command to expand/contract in void move)
  float maxW;         // Maximum width the circles expand to.
  float speed;        // Speed at which the circles expand and contract
  float r;
  float g;
  float b;
  float a;


  Ball(float x_, float y_, float w_, float maxW_, float speed_, float r_, float g_, float b_, float a_) {
    x = x_;
    y = y_;
    w = w_;
    maxW = maxW_;
    speed = speed_;
    r = r_;
    g = g_;
    b = b_;
    a = a_;
  }
  
  void fishReturn () {
    aFish = new Fish (random(0,width),height);     // If fish intersects with a ball, return fish to baseline
                                                   // at a random x position.
  }


  void display() {
  // Draw the basic circle
    fill(r,g,b,a);
    ellipse(x,y,w,w);
  }

  void grow () {
    w = w + speed;            // Expand

    if (w == maxW) {
      w = - w;                // Contract
    }
  }
  
 
}  


