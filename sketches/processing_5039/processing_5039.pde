
class Ball {
 
  float x, y, radius, vx, vy;
  int hitCount = 0;

  
  Ball(float xpos, float ypos, float r) {
   
   x = xpos;
   y = ypos;
   radius = r; 
   
    
  }
  
  void display(float ballR, float ballG, float ballB) {
    fill(ballR, ballG, ballB);
    noStroke();
   ellipse(x, y, radius, radius);
    
  }

}

