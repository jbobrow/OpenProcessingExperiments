
class Ball {
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  Ball () {
   
    
    
  };
  
  void update () {
   
   xspeed += xaccel;
   yspeed += yaccel;
   //x = x + 1;
   x += xspeed;
   y += yspeed;
   
   //Bottom
   if (y > height) {
     yspeed = -yspeed;
   };
   
   //Right
   if (x > width) {
     xspeed = -xspeed;
   };
   
   //Left
   if (x < 0) {
     xspeed = -xspeed;
   };
   
  };
  
  void draw () {
   
   fill(0);
   ellipse(x,y,20,20);
    
  };
  
};

