
class Ship{

  float x;
  float y;
  float speed = 0.4;
  float shipSize = 50;

  Ship(){
  };
  
  void walk(){
    x = x + random (-speed, speed);
    y = y + random (-speed, speed); 
    
    fill(61,14,122);
    noStroke();
    ellipse(x,y,shipSize, shipSize);
  };
  
};

