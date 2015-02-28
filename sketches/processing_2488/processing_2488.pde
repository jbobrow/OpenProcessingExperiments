
class Ball {
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;   //setting the acceleration...change in speed
  float yaccel = .7;
  
  
  Ball (){   //constructor function
  
 };
  
  void update() {
    
    //x = x + 1;
    x += xspeed;
    y += yspeed;
    xspeed += xaccel;
    yspeed += yaccel;
    
    
    if (y > height) {
      yspeed = -yspeed;
    };
   
    if (x > width) {
    xspeed = -xspeed;
    };
    
    if (x < 0) {
      xspeed = -xspeed;
    };
  
  };
  
  void draw() {
    
    ellipse(x, y, 20, 20);
    
  };
  
  
  
};

