
class Rod {
  
  float x,y,l,theta;
  
  Rod(float x_,float y_) {
    x = x_;
    y = y_;
  }
  
  void traits(int mx, int my, int rl) {
    l = rl;
    l -= 0.01*dist(x,y,mx,my);
    if(l < 0) l = 0;
    theta = atan2(my- y, mx - x);
  }
  
  void update() {
    pushMatrix();
    translate(x,y);
    line(0,0,l*cos(theta), l*sin(theta));
    popMatrix();
  }
}


