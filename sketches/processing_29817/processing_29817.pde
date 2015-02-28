
class Ball{
  
  // Fields
  float radius;
  float initialRadius;
  float colorRed;
  float colorGreen;
  float colorBlue;
  float xLoc;
  float yLoc;
  float moveX;
  float moveY;
  int explodeSize;
  int MAX_SIZE = 137;
  int ballCounter = 0;
  boolean dead = false; // Time Expired, Delete from screen
  boolean exploded; // Explosion rate starts
  boolean finished = false; // Explosion rate ends
  
  // Constructor
  Ball(float x, float y, float moveInX, float moveInY, float r){
    radius = r;
    initialRadius = radius;
    colorRed = random(255);
    colorGreen = random(255);
    colorBlue = random(255);
    xLoc = x;
    yLoc = y;
    moveX = moveInX;
    moveY = moveInY;
    explodeSize = 0;
    exploded = false;
  }
  
  // CLASS METHODS
  
  void renew(){
    explodeSize = 0;
    exploded = false;
    colorRed = random(255);
    colorGreen = random(255);
    colorBlue = random(255);
    initialRadius = radius;
    
    ballCounter = 0;
    dead = false; // Time Expired, Delete from screen
    finished = false; // Explosion rate ends
  }
  
  void display(){

    fill(colorRed,colorGreen,colorBlue,150);
    if(ballCounter<120) // LASTS 120 Frames or approx 2 seconds
      ellipse(xLoc,yLoc,radius,radius); 
    else{
      dead = true;
    }
    if(finished) // Counter starts when ball is at max explosion.
      ballCounter++;
  }
  
  void move(){
    if(explodeSize < 1){ // Stop Moving if it's clicked!
      xLoc += moveX;
      yLoc += moveY;
    }
  }
  
  void checkBoundary(){
    if(yLoc + radius/2 > (height) || yLoc - radius/2  < 0)
      moveY *= -1;
    if(xLoc + radius/2 > (width) || xLoc - radius/2 < 0)
      moveX *= -1; 
  }
  
  // Stop Moving, Increase Radius
  void explosion(){
    exploded = true;
    moveX = 0;
    moveY = 0;
    if(radius < MAX_SIZE)
      radius += 2;
    else
      finished = true;
    }
}




