
class Ball {
  float x, y, speed, angle;
  int r;
   
  Ball(int r_, float startX, float startY, float startSpeed, float startAngle) {
    r = r_;
    x = startX;
    y = startY;
    speed = startSpeed;
    angle = startAngle;
  }
  
  void increaseSpeed(float factor) {
    speed += factor;
  }
  
  String move() {
    
    String winner = "";
    
    // convert ball from polar coordinates
    x += speed * cos(angle);
    y += speed * sin(angle);
  
    // check if out of bounds top/bottom
    if (y <= r || y >= height - r) {
      angle -= radians(90);
      
      // check if new angle would cause x y to go out of bounds and if so, reverse angle
      float testX = x + speed * cos(angle);
      float testY = y + speed * sin(angle);
      
      if (testX <= r || testX >= width - r || testY <= r || testY >= height - r) {
        angle += radians(180);
      }
              
      x += speed * cos(angle);
      y += speed * sin(angle);
    }

    // check if out of bounds and missed paddle
    if (x < - r && !paddleLeft.hitTestRightEdge(this)) {
      winner = "player 2";
    } else if (x > width + r && !paddleRight.hitTestLeftEdge(this)) {
      winner = "player 1";
    }
    
    // hit test: left paddle
    if (paddleLeft.hitTestRightEdge(this)) {
      angle -= radians(90);
      
      float testX = x + speed * cos(angle);
      float testY = y + speed * sin(angle);
      
      // test if ball goes beyond paddle after changing angle. if so, reverse angle
      if (testX <= r + paddleLeft.w) {
        angle += radians(180);
      }
    }
    
     // hit test: right paddle
    if (paddleRight.hitTestLeftEdge(this)) {
      angle -= radians(90);
      
      float testX = x + speed * cos(angle);
      float testY = y + speed * sin(angle);
      
      // test if ball goes beyond paddle after changing angle. if so, reverse angle
      if (testX >= width - r - paddleRight.w) {
        angle += radians(180);
      }
    }

    
    return winner;
  }

  void position(float x_, float y_) {
    x = x_;
    y = y_;   
  }
  
  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, r*2, r*2); 
  }
}

