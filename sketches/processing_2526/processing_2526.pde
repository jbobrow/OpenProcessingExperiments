
class Orange {
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  Orange() {
  
  };
  
  void update() {
    
    xspeed += xaccel;
    yspeed += yaccel;
    // x = x+1; 
     x+=xspeed;
     y+=yspeed;
     
     //BOTTOM
     if (y > height) {
       yspeed = -yspeed;
     };
     //RIGHT
      if (x > width) {
       xspeed = -xspeed;
     };
     //LEFT
      if (x < 0) {
       xspeed = -xspeed;
     };
     
  };
  
  void draw() {
    fill(250,150,0);
    stroke(250,150,0);
    ellipse(x,y,30,30);
  };
  
};

