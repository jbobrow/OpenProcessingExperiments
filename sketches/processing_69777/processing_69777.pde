
class Ball {


  int posX;
  int posY;
  int ballSpeedX;
  int ballSpeedY;
  int ballDiam;
  color filler;


  Ball(int tempPosX, int tempPosY, int tempBallSpeedX, int tempBallSpeedY, int tempBallDiam, int tempFiller) {
    posX = tempPosX;
    posY = tempPosY;
    ballSpeedX = tempBallSpeedX;
    ballSpeedY = tempBallSpeedY;
    filler = tempFiller;
    ballDiam = tempBallDiam;
  }

  void display() {
    fill(filler);
    ellipse(posX, posY, ballDiam, ballDiam);
  }

  void animate() {

    posX += ballSpeedX;
    posY += ballSpeedY;
    
    if (posX > width-ballDiam || posX <= ballDiam) {
      ballSpeedX = -ballSpeedX;
    }
    if (posY > height-ballDiam || posY <= ballDiam) {
      ballSpeedY = -ballSpeedY;
    }
  }
}
//  void mouseUse() {
//    if (mousePressed) {
//      posX = mouseX;
//      posY = mouseY;
//    }
//
//    else {
//
//      posX += ballSpeedX;
//      posY += ballSpeedY;
//    }
//  }
//
//  void mouseReleased() {
//
//      ballSpeedX = mouseX-pmouseX;
//      ballSpeedY = mouseY-pmouseY;
//    }



