
class Ball{
  
  float x; //telling processing to expect something called x, and something called y.
  float y;
  
  float xspeed = 0; //this gives a value for CONSTANT motion. no acceleration. 
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  color col = #000000;
  
  
  //this is a constructor function. it does not need the "void" at the beginning because what it returns is what it is
  Ball(){
  
  };
  
  void update(){
    xspeed += xaccel;
    yspeed += yaccel;
    
    //x = x + 1; the same effect is achieved by the next line.
    x += xspeed; //takes whatever is on the right and adds it to whatever is on the left
    y += yspeed; //the 1 is the speed. it moves 1 pixel per frame.
    
    if (y > height) {
      yspeed = -yspeed;
    };
    
    if (x > width) {
      xspeed = -xspeed;
    };
    
    if (x < 0 ){
      xspeed = -xspeed;
    };
    
  
  };
  
  void draw(){
    noStroke();
    fill(col);
    ellipse(x, y, random (20), random (15) );
  
  };
  
  
  
};

