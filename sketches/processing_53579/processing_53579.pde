
class Ball {
 
  float x;
  float y;
  float r;
  float endX;
  float endY;
  float damping = 0.009;
  float spring = 0.05;
  boolean isHovered = false;

  Ball(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
    
    // for gravitational pull toward the center, set endX and endY coordinates to center point
    endX = width/2;
    endY = height/2;
  }
  
  void display() {
    
    // increment end coordinates toward centerpoint
    endX = endX + (width/2 - endX) * damping;
    endY = endY + (height/2 - endY) * damping;

    
    // increment x and y coordinates
    x = x + (endX - x) * damping;
    y = y + (endY - y) * damping;
    
    if (!isHovered) {
      fill(255, 190);
    } else {
      fill(255);
    }
    noStroke();
    ellipse(x, y, r*2, r*2); 
  }
  
  void position(float x, float y) {
    endX = x;
    endY = y;
  }
  
  void hitTest(Ball ball) {
    
    float minDistance = ball.r + r;
    
    // if a hit test is registered, propell balls in the opposite direction 
    if (dist(ball.x, ball.y, x, y) < minDistance) {
            
      // first, get the difference between the two x, y coordinates
      float dx = ball.x - x;
      float dy = ball.y - y;

      /*
      next, calculate the angle in polar coordinates
      atan2 calculates the angle (in radians) from a specified point to the coordinate origin, 
      as measured from the positive x-axis. more info here: http://processing.org/reference/atan2_.html
      */
      float angle = atan2(dy, dx);
      
      // now, calculate the target coordinates of the current ball by using the minimum distance
      float targetX = x + cos(angle) * minDistance;
      float targetY = y + sin(angle) * minDistance;
            
      // increment the x and y coordinates for both objects
      x = x - (targetX - ball.x) * spring;
      y = y - (targetY - ball.y) * spring;
      ball.x = ball.x + (targetX - ball.x) * spring;
      ball.y = ball.y + (targetY - ball.y) * spring;
    } 
  }
  
  void propell() {
    
    // randomize angle relative to sketch center
    float angle = random(360);
    
    // increment endX and endY coordinates
    endX = x - cos(angle) * height/2;
    endY = y - sin(angle) * height/2;
  }
  
  void onMouseOver(float mx, float my) {
    if (dist(mx, my, x, y) < r) {
      isHovered = true;
    } 
    else {
      isHovered = false; 
    }
  }
  
}

