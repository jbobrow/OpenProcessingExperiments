
class Confetti{
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  float confettiSize = 10;
  
  Confetti() { 
  
    
  };
  
  void update() {
    
    xspeed += xaccel;
    yspeed += yaccel;
    
    x += xspeed;
    y += yspeed;
    
    fill(random(0,255),random(0,255),random(0,255),50);  
    ellipse (x,y,confettiSize, confettiSize);
    
    
    
    //Bottom
    if (y > height) {
    
    yspeed = -yspeed;  
    };
    
    //right
    if (x > width) {
      xspeed = -xspeed;
    };
    
    //left
    if ( x < 0){
      xspeed = -xspeed;
    };
    
  };
  
  void draw() {
    
    fill(random(0,255),random(0,255),random(0,255),70);
    stroke(0,0,0,50);
   // ellipse (x,y,20,20);
    ellipse (x,y,confettiSize, confettiSize);
  };
  
  
  
  
};

