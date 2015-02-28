
// Ball Class, used for coding each ball.
class Ball {
  float ball_x, ball_y;
  float ball_radius;
  float vball_x = 0;
  float vball_y = 0;
  float speed_x, speed_y;
  color ball_color;
  
  // Incoming ball function and variables.
  Ball(float tempX, float tempY, int tempRadius, float tempXSpeed, float tempYSpeed, int bcLower, int bcUpper, boolean roof) {
    
    //Incoming variables defined and assigned
    ball_radius = tempRadius;
    ball_x = tempX;
    ball_y = tempY;
    speed_x = tempXSpeed;
    speed_y = tempYSpeed;
    
    ball_color = color(random(bcLower,bcUpper), random(bcLower,bcUpper), random(bcLower,bcUpper));
  }
  
  void createBall() {
    fill(ball_color);
    ellipseMode(CENTER);
    ellipse(ball_x, ball_y, 2*ballRadius, 2*ballRadius);
  }
  
  void moveBall() {
    ball_x += speed_x;
    ball_y += speed_y;
  }
  
  void useGravity() {
    speed_y += gravity;
  }
  
  void collisionWallChecker() {
    if (ball_y + ballRadius >= height) {
      ball_y = height - ballRadius;   
      speed_y = speedFix(speed_y);
    }
    if (ball_y - ballRadius <= 0 && roof) {
      speed_y *=-1;
    }
    if (ball_x + ballRadius >= width) {
      speed_x *=-1;
    }
    if (ball_x - ballRadius <= 0) {
      speed_x *=-1;
    }    
  }
  
  // used to calculate the y speed after hitting the floor.
  float speedFix(float speed) {
    float tempSpeed;
    tempSpeed= speed;
    tempSpeed *= -1;
    tempSpeed *= damping;
    return(tempSpeed);
  }
}

