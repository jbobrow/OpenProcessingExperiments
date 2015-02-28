
class Moss{
  
  float x;
  float y;
  
  float speed = 1;
  float mossSize =2;
  
  Moss() {
    
  };
  
  void grow(){
    
    x = x + random (-speed, speed);
    y = y + random (-speed, speed);
    
    fill (random (0,100), random (255), random (0,100));
    noStroke();
    ellipse (x, y, mossSize, mossSize);
    
  };
  
};
    
  

