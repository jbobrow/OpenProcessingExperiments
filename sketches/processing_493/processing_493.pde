
class Fly {
  // swarm animation
  float homeX, homeY;
  float rangeX, rangeY;
  float angle;
  float step;
  
  // current position
  float currX, currY;
  
  // move animation
  float targetX, targetY;
  boolean atTarget;
  
  // paing variables
  int bodySize;
  int wingSpan;
  float flap;
  float flapStep;
  
  Fly(float x, float y) {
    // init the move variables
    homeX = random(x-SWARM_OFFSET, x+SWARM_OFFSET);
    homeY = random(y-SWARM_OFFSET, y+SWARM_OFFSET);
    newTarget(homeX, homeY);
    
    // init the swarm variables
    rangeX = random(20, 50);
    rangeY = random(20, 50);
    angle = 0;
    step = random(-0.1, 0.1);
    
    // init the paint variables
    bodySize = (int)random(5, 10);
    wingSpan = (int)random(5, 10);
    flap = 0;
    flapStep = (bodySize*1.0/wingSpan)/5;
  }
  
  void paint() {
    pushMatrix();
      translate(currX, currY);
      rotate(angle);
      
      // draw the wings
      stroke(#02B409);
      line(0, 0, -wingSpan, -sin(flap)*wingSpan);
      line(0, 0, wingSpan, -sin(flap)*wingSpan);
      flap += flapStep;
      
      // draw the body
      fill(#B47C02);
      noStroke();
      ellipse(0, 0, bodySize, bodySize);
    popMatrix();
  } 
  
  void move() {
    // calculate the distance to the target
    float dX = targetX-homeX;
    float dY = targetY-homeY;
    
    // calculate the current step towards the target
    float stepX = dX/10;
    float stepY = dY/10;
    
    homeX += stepX;
    homeY += stepY;
    
    // if we're close enough to the target...
    if (abs(dX) < 1 && abs(dY) < 1) {
      // ...assume we've reached it
      atTarget = true;
    }
  }
  
  void swarm() {
    // hover around the home position
    currX = int(rangeX*sin(angle)+homeX);
    currY = int(rangeY*cos(angle)+homeY);
    angle += step;
  }
  
  void newTarget(float newX, float newY) {
    // set a new target position for the home
    targetX = random(newX-50, newX+50);
    targetY = random(newY-50, newY+50);
    atTarget = false;
  }
  
  boolean isAtTarget() {
    return atTarget;
  }
}

