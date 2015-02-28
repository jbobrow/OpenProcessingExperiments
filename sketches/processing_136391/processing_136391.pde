
class Ball {
  float xPos;
  float yPos;
  float xDest;
  float yDest;
  float xVel;
  float yVel;
  float xAcc;
  float yAcc;
  float size;
  float value;
  color myColor;
  boolean moving;
  
  Ball( float x, float y ,  float d , float v ) {
    xPos = x;
    yPos = y;
    xDest = xPos;
    yDest = d;
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0.1;
    size = 10;
    value = v;
    myColor = color(150);
    moving = true;
  }
  
  void setColor(color c) {
    myColor = c;
  }
  
  void setSize(float v) {
   size = v;
  } 
  
  float getValue() {
    return value;
  }
  
  void update() {
    if (moving) {
      xPos = xPos + xVel;
      yPos = yPos + yVel;
      xVel = xVel + xAcc;
      yVel = yVel + yAcc;
      if(yPos>=yDest-size) {
        yPos = yDest;
        moving = false;
      }
    }
  }
  
  boolean isDone() {
    if(moving) {
      return false;
    }
    else {
      return true;
    }
  }
    
  
  void draw() {
    fill(myColor);
    ellipse(xPos,yPos,size,size);
  }
}

