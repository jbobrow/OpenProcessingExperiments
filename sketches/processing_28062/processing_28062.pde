
class Ball {
  
  float x, y;
  float vx, vy;
  
  final float GRAVITY = 0.25;
  
  final int RADIUS = 10;
  
  
  
  Ball(float xPos, float yPos, float xVel) {
    x = xPos;
    y = yPos;
    vx = xVel;
  }
  
  void move() {
    vy = vy + GRAVITY;
    
    x = x + vx;
    y = y + vy;
  }
  
  void draw() {
    noStroke();
    fill(255);
    ellipse(x, y, RADIUS, RADIUS);

  }
  
  void checkTouch() {
    for (Stair stair : stairs) {
      if (y + RADIUS > stair.y && y - RADIUS < stair.y &&
          x - RADIUS < stair.x + STAIR_SIZE && x + RADIUS > stair.x) {
        y = stair.y - RADIUS;
        if (stair.left && vx > 0 || !stair.left && vx < 0) {
          vx = vx * -1;
          vy = vy / 2;
        }
        stair.takeDamage();
      }
    }
  }
  
}


