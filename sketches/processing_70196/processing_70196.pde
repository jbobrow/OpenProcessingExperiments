
class Ball {
  float ballX, ballY;
  float ballSize;
  float alph;
  float xVel, yVel;
  float id;

  //constructor
  Ball(float _ballX, float _ballY, float _ballSize, float _alph, 
  float _xVel, float _yVel, float _id) {
    ballX = _ballX;
    ballY = _ballY;
    ballSize = _ballSize;
    alph = _alph;
    xVel = _xVel;
    yVel = _yVel;
    id = _id;
  }

  //methods
  void display() {
    fill(0, alph);
    noStroke();
    ellipse(ballX, ballY, ballSize, ballSize);
  }

  void update() {
    int n = (width+50);
    ballX += xVel;
    ballY += yVel;

    if (ballX > n) {
      xVel--;
    }
    if (ballX < -50) {
      xVel++;
    }
    if (ballY > n) {
      yVel--;
    }
    if (ballY < -50) {
      yVel++;
    }
  }
}

