
class Box {

  float r;
  float x,y;
  float xspeed,yspeed;
 
  
 color c = color(0);
  
  // Constructor
  Box(float tempR) {
    r = random(5,25);
    x = 11;
    y = random(height);
    while (touchingAny()) {
      y = random(height);
    }
    xspeed = random(0.5,1.5);
    yspeed = 0;
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    if (x > (width-10) || x < 10) {
      xspeed *= - 1;
    }
    

    if (y > (height-10) || y < 10) {
      yspeed *= - 1;
    }
  }
  
  boolean touchingAny() {
    for (int i = 0; i < boxes.length; ++i) {
      Box b = boxes[i];
      if (b != null && b != this && intersect(b)) {
        return true;
      }
    }
    return false;
  }
  
  void highlight() { 
    c = color(255);
       
  }
 
  void display() {
    stroke(c);
    fill(0);
    rect(x,y,r*2,r*2);
          
 }
  
  
  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
 boolean intersect(Box b) {
    
    // Objects can be passed into functions as arguments too! 
    float distance = dist(x,y,b.x,b.y); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < r + b.r) {
      return true;
    } else {
      return false;
    }
  }
}
  

