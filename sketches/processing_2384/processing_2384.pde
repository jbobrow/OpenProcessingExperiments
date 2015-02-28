


class Cuadro{
  
  float x;
  float y;
  
  float xspeed = 0;
  float yspeed = 0;
  
  float xaccel = 0;
  float yaccel = 0.1;
  
  
  
  Cuadro() { 
  
    
  };
  
  void update() {
    
    xspeed += xaccel;
    yspeed += yaccel;
    
    x += xspeed;
    y += yspeed;
    
    
    

    
  };
  
  void draw() {
    
    fill(random(255),random(255),random(255));
    rect (x,y,20,20);
    noStroke();
   
  };
  
  
  
  
};





