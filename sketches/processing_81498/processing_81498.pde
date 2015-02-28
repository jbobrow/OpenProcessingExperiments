
class Circle {
  float xPosition;
  float yPosition;
  float xVelocity;
  float yVelocity;
  float xAcceleration;
  float yAcceleration;
  int timeLeftAccelerating;
  color colour;

  Circle(int x, int y) {
    xPosition = x;
    yPosition = y;
    xVelocity = 0;
    yVelocity = 0;
    //xAcceleration = newAcceleration();
    //yAcceleration = newAcceleration();
    colour = color(35,216,215);
    timeLeftAccelerating = 0;
  }
}


