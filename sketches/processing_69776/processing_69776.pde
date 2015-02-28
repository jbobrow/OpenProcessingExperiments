
class Ball {

  int posX;
  int posY;
  int ballSpeedX;
  int ballSpeedY;
  int ballDiam;
  float distance;
  color col;

  Ball (int tempPosX, int tempPosY, int tempBallSpeedX, int tempBallSpeedY, int tempBallDiam, color tempCol) {
    posX = tempPosX;
    posY = tempPosY;
    ballSpeedX = tempBallSpeedX;
    ballSpeedY = tempBallSpeedY;
    ballDiam = tempBallDiam;
    col = tempCol;
  }

  void makeObject () {
    smooth();
    noStroke();
    fill (col);
    ellipse (posX, posY, ballDiam, ballDiam);
  }

  void animate () {

    posX += ballSpeedX;
    if (posX > width || posX < 0) {
      ballSpeedX *= -1;
    }
    posY += ballSpeedY;
    if (posY > height || posY < 0) {
      ballSpeedY *= -1;
    }
  }
}


