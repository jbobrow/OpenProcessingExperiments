

public static class Ball{
  int ball_x, ball_y, ball_xVel, ballSize, initialSpeed;
  float ball_yVel;
  int startX, startY;
  int lastHorizontalBounceTime = 0;
  
  private Ball(int x, int y, int xSpeed, int ySpeed, int s, int speed){
    startX = x;
    startY = y;
    ball_x = x;
    ball_y = y;
    ball_xVel = xSpeed;
    ball_yVel = ySpeed;
    ballSize = s;
    initialSpeed = speed;
  }
  
  public static Ball middleBall(int speed){
    return new Ball(screenWidth/2, screenHeight/2, speed, 0, 20, speed);
  }
  
  public static Ball rightBall(int speed){
    return new Ball(screenWidth/2 + 100, screenHeight/2, speed, 0, 20, speed);
  }
  
  public static Ball leftBall(int speed){
    return new Ball(screenWidth/2 - 100, screenHeight/2, speed, 0, 20, speed);
  }
  
  public void ballReset(){
    ball_x = startX;
    ball_y = startY;
    ball_xVel = initialSpeed;
    ball_yVel = 0;
  }

}

