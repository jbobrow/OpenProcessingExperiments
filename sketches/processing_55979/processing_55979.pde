
class Avatar {
  float xPos;
  float yPos;
  float xDir;
  float yDir;
  float speed = 6;
  
  Avatar(float axPos, float ayPos, float axDir, float ayDir) {
    float xPos = axPos;
    float yPos = ayPos;
    float xDir = axDir;
    float yDir = ayDir;
  }
  
  void render() {
    fill(avVal);
    ellipse(xPos, yPos, 10, 10);
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





