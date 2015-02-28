
class Ball{
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  Ball(){
    
    };
    
    
  void update(){
    
    xspeed += xaccel;
    yspeed += yaccel;
    
    
    //x= x + 1; This is equal to the one below
    x += xspeed;
    y += yspeed;
    
    if (y > height){
      yspeed = -yspeed;
    };
      
    if (x > width){
      xspeed = -xspeed;
      
    };
    
    if (x < 0){
      xspeed = -xspeed;
      
    };
    
  };
  
  void draw(){
  noStroke();
  fill(random(200,255),random(0,250),random(0,250),25);
  ellipse(x,y,50,50);
  
  
  };
  
  
  
  
};

