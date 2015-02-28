
// SIMONE ROTH - PS 3 # 1 //


class Ball {

  float ballX;
  float ballY;
  float ballW;
  float ballH;
  float ballC;


  Ball(color tempC, float tempX, float tempY, float tempW, float tempH) {

    ballX = tempX;
    ballY = tempY;
    ballW = tempW;
    ballH = tempH;
    ballC = tempC;
  }

  void displayBall() {

    fill(ballC);
    ellipse(ballX,ballY, ballW, ballH);
  }

  void moveBall() {
    if (animate == true) { 
      ballY = ballY + speed;
      speed = speed + gravity;
      if (ballY >= height-120) {

        speed *= -0.9;
      }
    }
  }
}



