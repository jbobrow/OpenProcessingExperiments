
class Ball {                                                                //create Ball class

  int posX;        
  int posY;
  float ballDiam;
  color col;
  float ballSize1;
  float ballSize2;

  Ball (int tempPosX, int tempPosY, float tempBallDiam, color tempCol, 
  float tempBallSize1, float tempBallSize2) {                          //create constructor argument
    posX = tempPosX;
    posY = tempPosY;
    ballDiam = tempBallDiam;
    col = tempCol; 
    ballSize1 = tempBallSize1;
    ballSize2 = tempBallSize2;
  }

  void build() {                                                             //building the ball
    smooth();            
    noStroke();
    fill (col);
    float d = dist(posX, posY, mouseX, mouseY);                              //measure distance between balls and mouse point
    float ballDiam = map(d, 0, width, ballSize1, ballSize2);           //mapping mouse location with ball size
    ellipse (posX, posY, ballDiam, ballDiam);
  }
}


