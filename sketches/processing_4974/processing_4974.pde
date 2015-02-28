
class Ball {

  // initialization
  float xSpeed;
  float ySpeed;
  float x;
  float y;

  // initial values hard coded
  float radius = 40;

  // swithc to true when ball is missed
  boolean miss;
  boolean getIt;
  // listening points to adjust speed
  int countPoints;

  // constructor - x and y positions, x- and y-speed
  Ball(float tmpX, float tmpY, float tmpXSpeed, float tmpYSpeed) {
    xSpeed = tmpXSpeed;
    ySpeed = tmpYSpeed;
    x = tmpX;
    y = tmpY;
  }

  // communicating X and Y positions of the cathcer
  float getXPosition() {
    return x;
  }

  float getYPosition() {
    return y;
  }

  // display ball as a circle
  void display() {
    fill(0, 200, 0);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x, y, radius, radius);
  }

  // move ball
  void move() {

    y += ySpeed; // default move downwards with x-speed
    x += xSpeed; // default move with y-speed

      // reaching the floor sets y to 0, restart the move
    if (y >= height) {
      y = 0;
    } 
    else if (y <= 0) {
      ySpeed *= -1;
    } 
    else if (getIt) {
      y -= 35;
      if (ySpeed > 0) {
        ySpeed *= -1;
      }
    }

    // reaching the edges, change direction
    if ((x <= 0) || (x >= width)) {
      xSpeed *= -1;
    }
  }

  // checking if ball is catched
  void amI(Catcher c) {
    getIt = c.getCatched();
  }


  void setMissed() {
    if (y == height) {
      miss = true;
    } 
    else {
      miss = false;
    }
  }

  boolean missed() {
    return miss;
  }

  void increaseSpeed(Counter c) {
    int lev = c.getLevel();
    if (lev > 0) {
      xSpeed *= 1.0001;
      ySpeed *= 1.0001;
    }
  }
}

