
class Ball{
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0.5;
  float yaccel = 0.1;
  
  float ballSize = 10;
  
  
  Ball(){
    
  
  };
  
  void update(){
    
    xspeed += xaccel;
    yspeed += yaccel;
    
    //x = x + 1;
    x += xspeed; //compound addition operator. same as saying x = x + 1. 
    y += yspeed;
    
    
    //BOTTOM
    if (y > height) {
      yspeed = -yspeed;
      ballSize = ballSize/1.2;
    };
    
    //RIGHT
    if (x > width){
      xspeed = -xspeed;
      ballSize = ballSize*1.18;
    };
    
    //LEFT
    if (x < 0){
      xspeed = -xspeed;
      ballSize = ballSize*1.2;
    
    };
    
  
  };

  void draw(){
  noStroke();
  fill (random(100),random(220),255);
  ellipse(x,y,ballSize,ballSize);
  
  };
  
  
};

