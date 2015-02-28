
class Box {
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  Box() {
  
  };
  
  void update() {
    
    xspeed += xaccel;
    yspeed += yaccel;
     
     x+=xspeed;
     y+=yspeed;
     
   
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
    fill(#ffcccc);
    stroke(129);
    rect(x,y,30,20);
  };
  
};

