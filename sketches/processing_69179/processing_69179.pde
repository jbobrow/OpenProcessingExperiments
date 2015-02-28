
class Ball {
  int posX;
  int posY;
  color ballColor;  
  int velocityX;
  int ballSize;

  void init(int thisPosX, int thisPosY, int thisVelocityX, int thisBallSize, color thisColor) {
    posX = thisPosX;
    posY = thisPosY;
    velocityX = thisVelocityX;
    ballColor = thisColor;
    ballSize = thisBallSize;
  }

  void updateBall() {
    posX=posX+velocityX;

    if (posX>width-10) { /*if position of the ball gets to the end of the screen, move it back to a random 
     y value and x value with a random speed and random size*/
      posX=int(random(-500, -300)); 
      posY=int(random(-300, 300)); 
      velocityX=(int)random(1, 4);
      ballSize=(int)random(0, 10);
    }
  }

  void drawBall() {
    noStroke();
    fill(ballColor);
    ellipse(posX, posY, ballSize, ballSize);
  }
}


