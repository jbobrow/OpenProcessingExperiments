

class Target {
  
 float x = 0;
 float y = 0;

 float velX = 0;
 float velY = 0;
 
 float targetSize = 50;
 
 boolean enabled = true;
 
 Target (float xpos, float ypos, float velx, float vely) {
 
   x = xpos;
   y = ypos;
   
   velX = velx;
   velY = vely;
 
   
 }
 
  void update () {
  
    if(!enabled) return;
    
      x+=velX;
      y+=velY;
    
      
      
      fill (0,255,0);
      noStroke ();
      ellipse (x, y, targetSize, targetSize);
  
  
  
}

  boolean hitTest(int xpos, int ypos) {
    
  return(dist(x, y, xpos, ypos) < targetSize/2);
 //this means if this return true if not turn false
  

  }
}

