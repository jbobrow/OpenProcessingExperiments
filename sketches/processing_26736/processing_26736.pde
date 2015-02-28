
class Box {
  
  float r;
  float x,y,x2,y2;
  float xspeed,yspeed,x2speed,y2speed;
  color c = color(0);
  
  // Constructor
  Box(float tempR) {
    r = tempR;
    x = 0;
    y = random(height);
    x2 = random(width);
    y2 = 0;
    xspeed = random(1,2);
    yspeed = 0;
    x2speed = 0;
    y2speed = random(1,2);
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    x2 += x2speed; 
    y2 += y2speed;
    
    
    if (x > (width-10) || x < 0) {
      xspeed *= - 1;
    }
    

    if (y > (height-10) || y < 0) {
      yspeed *= - 1;
    }
    
    if (x2 >(width-10) || x < 0) {
      x2speed *= - 1;
    }
    

    if (y2 >(height-10)|| y < 0) {
      y2speed *= - 1;
    }
  }
  

  void highlight() { 
    c = color(255,5,193);
  }
 
  void display() {
    stroke(0);
    fill(c);
    rect(x,y,r*2,r*2);
    
    
    c = color(255);
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

