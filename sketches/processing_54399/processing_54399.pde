
class Ball {
  
  int posX;
  int posY;
  int tileWidth;
  int rad; // radius
  float xSpeed;
  float ySpeed;
  int pSide;
  int opacity;
  
  Ball(int x, int y, int w, float xs, float ys) {
    posX = x;
    posY = y;
    tileWidth = w;
    rad = tileWidth/2;
    xSpeed = xs;
    ySpeed = ys;
    pSide = 4;
    opacity = 255;
  }
  
  int getX() {
    return posX;
  }
  
  int getY() {
    return posY;
  }
  
  void display() {
    stroke(0);
    fill(20, 240, 200, opacity);
    ellipse(posX, posY, tileWidth, tileWidth);
    noStroke();
    fill(50, 150, 150);
    ellipse(posX, posY, rad, rad);
  }
  
  // change direction upon collision
  void collide(int direction, int lim) {
    pSide = lim;
    switch(direction) {
      case NORTH:
      case SOUTH:
        ySpeed *= -1;
        break;
      case EAST:
      case WEST:
        xSpeed *= -1;
        break;
    }
  }
  
  // move ball
  void advance() {
    posX += xSpeed;
    posY += ySpeed;
    if (posX + rad > width && pSide != EAST) {
      collide(EAST, pSide);
      pSide = EAST;
    }
    else if (posX - rad < 0 && pSide != WEST) {
      collide(EAST, pSide);
      pSide = WEST;
    }
    if (posY + rad > height && pSide != SOUTH) {
      collide(NORTH, pSide);
      pSide = SOUTH;
    }
    else if (posY - rad < 0 && pSide != NORTH) {
      collide(NORTH, pSide);
      pSide = NORTH;
    }
  }
  
  // detect collision
  boolean detectCollision(int x, int y) {
    if (x > posX - rad && x < posX + rad && y > posY - rad && y < posY + rad) {
      return true;
    }
    return false;
  }
  
  void changeAlpha(int a) {
    if (a != 255) opacity += a;
    else opacity = 255;
  }
  
  // return true if ball has collided with too many bombs
  boolean done() {
    if (opacity < 0) {
      return true;
    }
    return false;
  }
  
}

