
class Cansu {

  float r; 
  float x,y; 
  float xspeed,yspeed;
  
  // Constructor
  Cansu(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 3,3);
    yspeed = random( - 5,5);
  }
  
  
    void topciz() {
    noStroke();
    fill(random(20,255));
    ellipse(x,y,r*2,r*2);
  }
  
  
  void hareket() {
    x += xspeed;
    y += yspeed; 
  }
    
  
  void carparsa () {
    
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
}


