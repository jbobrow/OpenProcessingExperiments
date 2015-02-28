
class Ball {
  
  float x;
  float y;
  float xVel;
  float yVel;
  float bRadius;
  
  Ball(float x1, float y1, float x2, float y2) {
    //Code from TJ's one sided pong
    float contVel = -10.0;
    float theta = atan2(y1 - y2, x1 - x2);
    PVector vel = new PVector(cos(theta)*contVel, sin(theta)*contVel);
    
    x = x1;
    y = y1;
    bRadius = 3;
    xVel = vel.x;
    yVel = vel.y;
  }
  
  void drawBall(int player) {
    if (player == 0) {
      fill(255,0,0);
      noStroke();
      ellipse(x,y,bRadius,bRadius);
    }
    else {
      fill(#FAFAFA);
      noStroke();
      ellipse(x,y,bRadius,bRadius);
    }
  }
  
  void moveBall() {
    x += xVel;
    y += yVel;
  }
  
  
}

