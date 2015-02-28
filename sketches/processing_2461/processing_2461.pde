
class Ball {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  color col = 0;
 
  Ball() {
    
  };
  
  
  void update() {
    
    xspeed += xaccel;
    yspeed += yaccel;
    // x = x + 1; this is the same thing as :    x += 1;      the 1 is speed. so now we've added a speed factor up above (float xspeed;) 
    x += xspeed;
    y += yspeed;
    if (y > height) {
      yspeed = -yspeed;
    };
    
    if (x > width) {
      xspeed = -xspeed;
    };
    
    if (x < 0) {
      xspeed = -xspeed;
    };
    
    if (y < 0) {
      yspeed = -yspeed;
    };
    
  };
  
  void draw() {
    fill(col);
    rect(x, y, 20, 40);
    
    
  };
  
};

