
class Ball {
  float east, west, north, south;
  int x, y, speed, radius, xDirection, yDirection;
  int wallDistance = 0;

  Ball() {
  }

  void setValues(int xpos, int ypos, int ballSpeed, int directionX, int directionY, int ballSize) {
    x = xpos;
    y = ypos;
    speed = ballSpeed;
    xDirection = directionX;
    yDirection = directionY;
    radius = ballSize;
  }

  void ballMotion() {
    if(x > 529 && y > 362) {
      east = 200;
      west = 200;
      north = 200;
      south = 200;
    } 
    else {
      //calculate red value at top, bottom, and both sides of the heart.
      //if a side hits a dark color, change direction according to which sides are affected.
      east = red(get(x + radius + wallDistance, y));
      west = red(get(x - radius - wallDistance, y));
      north = red(get(x, y - radius - wallDistance));
      south = red(get(x, y + radius + wallDistance));
    }
    if(north < 150 && west < 150 && yDirection == -1) {
      yDirection = 0;
      xDirection = 1;
    }
    if(north < 150 && west < 150 && xDirection == -1) {
      yDirection = 1;
      xDirection = 0;
    }
    if(north < 150 && east < 150 && yDirection == -1) {
      yDirection = 0;
      xDirection = -1;
    }
    if(north < 150 && east < 150 && xDirection == 1) {
      yDirection = 1;
      xDirection = 0;
    }
    if(south < 150 && west < 150 && yDirection == 1) {
      xDirection = 1;
      yDirection = 0;
    }
    if(south < 150 && west < 150 && xDirection == -1) {
      xDirection = 0;
      yDirection = -1;
    }
    if(south < 150 && east < 150 && xDirection == 1) {
      xDirection = 0;
      yDirection = -1;
    }
    if(south < 150 && east < 150 && yDirection == 1) {
      yDirection = 0;
      xDirection = -1;
    }
    if(dist(582, 415, x, y) > radius) {
      x += speed * xDirection;
      y += speed * yDirection;
    } 
    else {
      x += 0;
      y += 0;
    }
  }

  void display() {
    //when heart reaches soap_bot, add to congratz counter
    if(dist(582, 415, x, y) < radius) {
      x = -100;
      y = -100;
      congratz++;
    } 
    else {
      image(heart, x, y, radius + 6, radius + 6);
    }
  }
}





