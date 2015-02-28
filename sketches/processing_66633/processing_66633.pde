

class particle {

  float rad;
  float x, y;
  float xvel, yvel;
  boolean bound = false;

  particle(float X, float Y, float XVEL, float YVEL, float R) {
    x    = X;
    y    = Y;
    xvel = XVEL;
    yvel = YVEL;
    rad  = R;
  }
  void update(float dt, float fx, float fy) {

    xvel += fx*dt*rad;
    yvel += fy*dt*rad;
    x    += xvel*dt;
    y    += yvel*dt;

    if (bound) {
      
      float c = 0.95;
      
      // HORIZONTAL
      if (x<rad) {
        x    = rad;
        xvel = -xvel*c;
      } 
      if (x>width-rad) {
        x = width-rad;
        xvel = -xvel*c;
      }
      // VERTICAL
      if (y<rad) {
        y = rad;
        yvel = -yvel*c;
      } 
      if (y>height-rad) {
        y = height-rad;
        yvel = -yvel*c;
      }
    }
    else {
      if (abs(x)>4*width || abs(y)>4*height) {
        x    = random(rad, width-rad);
        y    = random(rad, height-rad);
        xvel = 0;
        yvel = 0;
        
      }
    }

    fill(255);
    ellipse(x, y, 2*rad, 2*rad);
  }
}


