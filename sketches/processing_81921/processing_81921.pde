

class Ball {
  
  //PImage face; 
//  face = loadImage("face.gif"); 
  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( - 5,5);
    yspeed = random( - 5,5);
  }
  
  float getX()
  {
    return x; 
  }
  
  float getY()
  {
     return y; 
  }
  
  float getXSpeed()
  {
    return xspeed;
  }
  
  float getYSpeed()
  {
    return yspeed;
  }
  
  void redoSpeeds()
  {
    xspeed *= -2; 
    yspeed *= -2; 
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }
  
  // Draw the ball
  void display() {
    stroke(0);
    fill(255,68,129);
    ellipseMode(CENTER); 
    ellipse(x,y,r*2,r*2);
  }
}

