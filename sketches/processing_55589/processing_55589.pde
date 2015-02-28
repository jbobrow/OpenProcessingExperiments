
class Ball {
  float xPos;
  float yPos;
  float diam;
  float xDir;
  float yDir;
  float speed;
  PImage img;
  
  Ball(float x, float y, float d, float xd, float yd, float s, PImage imgFaux) {
    xPos = x;
    yPos = y;
    diam = d;
    xDir = xd;
    yDir = yd;
    speed = s;
    img = imgFaux;
  }
  
  void update() {
    xPos = xPos + speed*xDir;
    yPos = yPos + speed*yDir;
  }
  
  void manageMove() {
    if (xPos >= (width-15)-(diam/2)) {
      xDir = xDir*(-1);
    }
    if (xPos <= (0+15)+(diam/2)) {
      xDir = xDir*(-1);
    }
    if (yPos >= (height-15)-(diam/2)) {
      yDir = yDir*(-1);
    }
    if (yPos <= (0+15)+(diam/2)) {
      yDir = yDir*(-1);
    }
  }
  
  void drawIt() {
    image(img, xPos-(diam/2), yPos-(diam/2), diam, diam);
  }
}

