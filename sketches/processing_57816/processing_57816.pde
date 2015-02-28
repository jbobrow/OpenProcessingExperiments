
class Avatar {
  float xPos;
  float yPos; //startY;
  float xDir;
  float yDir;
  float speed = 6;
  int avAlpha;

  Avatar(float xPos, float yPos, float xDir, float yDir) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xDir = xDir;
    this.yDir = yDir;
    
    yPos = height/2.0;
//    float xPos = axPos;
//    float yPos = ayPos;
//    float xDir = axDir;
//    float yDir = ayDir;
  }

  void render() {
    fill(avVal);
    ellipse(xPos, yPos, 10, 10);
     if((frameCount%20>10)&&(frameCount%20<20)) {
    avAlpha = 255;
  } else {
    avAlpha = 0;
  }
     
    stroke(avVal, avAlpha);
    strokeWeight(4);
    line(xPos, yPos-10, xPos, yPos+10);
    line(xPos-10, yPos, xPos+10, yPos);
    noStroke();
  }

  void move() {
    if (keyPressed) {
      if (keyCode == RIGHT) {
        xPos += xDir;
        xDir = speed;
      }
      if (keyCode == LEFT) {
        xPos += xDir;
        xDir = -speed;
      }
      if (keyCode == UP) {
        yPos += yDir;
        yDir = -speed;
      }
      if (keyCode == DOWN) {
        yPos += yDir;
        yDir = speed;
      }
      if (xPos < 0) {
        xPos = 1;
      }
      //      if (xPos > width) {
      //        xPos = avPlace;
      //      }
      if (yPos > height) {
        yPos = 0;
      }
      if (yPos < 0) {
        yPos = height;
      }
    }
  }
}




