
class Ant{
  
  float x;
  float y;
  float speed = 1;
  float antSize = 1;
  Ant(){
    
    
  };
  
  void walk(){
    //update the x and y
    x = x + random(-speed,speed);
    y = y + random(-speed,speed);
    
    
    
    
    //draw the ant
    fill(46,43,41,5);
    noStroke();
    rect(x,y,antSize,antSize);
    
  };
  
  
  
  
  
};

