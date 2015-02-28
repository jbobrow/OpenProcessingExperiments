
class Ant {
  
  float x;
  float y;
  float speed = 1;
  float antSize = 1;
  
  Ant() {
    
  };
  
  void walk() {
    //update the x and y
    x = x + random(-speed,speed);
    y = y + random(-speed,speed);
    
    //draw the ant
    fill(0,0,0,100);
    stroke(256,0,0,1);
    ellipse(x,y,antSize,antSize);
  };
  
};

