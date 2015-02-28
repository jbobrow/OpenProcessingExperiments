
class ball {
  float xBall;
  float yBall;
  float xBallSpeed;
  float yBallSpeed;
  float rBallCol;
  float gBallCol;
  float bBallCol;
  float diamBall;

  ball() {
    xBall = random (18, 500);
    yBall = random (18, 500);
    diamBall = 15;
    xBallSpeed = random(-3, -1);
    yBallSpeed = random(-3, 3);
    rBallCol = 0;
    gBallCol = 0;
    bBallCol = 0;
  }


  void animateBall() {
    xBall+= xBallSpeed;
    yBall+= yBallSpeed;
  }

  void displayBall() {
    noStroke();
    fill(rBallCol, gBallCol, bBallCol);
    ellipse (xBall, yBall, diamBall, diamBall);
  }

  void revertBall() {
    if (xBall>width-15) {
      xBallSpeed*=-1;
      rBallCol = 50;
      gBallCol = 100;
      bBallCol = 50;
      fill(rBallCol, gBallCol, bBallCol);
      ellipse (xBall, yBall, diamBall, diamBall);
    }
    if (xBall<15) {
      xBallSpeed*=-1;
      rBallCol = 150;
      gBallCol = 10;
      bBallCol = 150;
      fill(rBallCol, gBallCol, bBallCol);
      ellipse (xBall, yBall, diamBall, diamBall);
    }
    if (yBall>height-15) {
      yBallSpeed*=-1;
      rBallCol = 255;
      gBallCol = 215;
      bBallCol = 0;
      fill(rBallCol, gBallCol, bBallCol);
      ellipse (xBall, yBall, diamBall, diamBall);
    }
    if (yBall<15) {
      yBallSpeed*=-1;
      rBallCol = 0;
      gBallCol = 80;
      bBallCol = 220;
      fill(rBallCol, gBallCol, bBallCol);
      ellipse (xBall, yBall, diamBall, diamBall);
    }
  }
}

