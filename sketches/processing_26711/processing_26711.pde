
class Alien {
 float r;
 float x,y; 
  
  Alien(float tempR) {
    r = tempR;
   
    x = 0;
    y = 0;
  }
  
   void setLocation(float tempX, float tempY) {
   x = tempX;
   y = tempY;
 }

  void display() {
  
   image (myPImage,mouseX-60,mouseY-50);
  }
  
 
  boolean intersect(Drop d) {
    
    float distance = dist(x,y,d.x,d.y); 
    
    
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}

