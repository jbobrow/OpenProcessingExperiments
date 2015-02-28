
class Ball {

  float posX, posY, movX, movY, speedX, speedY, size;
  int stickOn;
  boolean sticky;
  
  
  Ball(float _posX, float _posY) {
    posX = _posX;
    posY = _posY;
    movX = 0;
    movY = 0;
    speedX = 0;
    speedY = 0;
    sticky = true;
    stickOn = 1;
    size = 6;
  }
  
  void setPos(float _posX, float _posY) {
    posX = _posX;
    posY = _posY;
  }
  
  void update() {
    if (sticky) {
      if (stickOn == 1) {
        posX = player1.posX + player1.thickness/2 + ball.size/2;
        posY = player1.posY;
      } else if (stickOn == 2) {  
        posX = player2.posX - player2.thickness/2 - ball.size/2;
        posY = player2.posY;      
      }  
    } else {
      posX = posX + movX;
      posY = posY + movY;
    }
    
    
    if (posY < size) movY = -movY;        // top bounce
    if (posY > height-size) movY = -movY; // bottom bounce
    
    if (posX < 0) { // out left side
      player2.scorePlus();
      sticky = true;
      stickOn = 1; 
    }
    
    else if (posX > width) { // out right side
      player1.scorePlus();
      sticky = true;
      stickOn = 2;
    }
    
    else if (posX < (player1.posX + (player1.thickness / 2) + (size / 2))) {
      if (player1.testRacketCollision(posX, posY, size)) {
        movX = -movX;
        movY += player1.getMovY() / 5;
      }
    }

    else if (posX > player2.posX) {  
      if (player2.testRacketCollision(posX, posY, size)) {
        movX = -movX;
        movY += player2.getMovY() / 5;
      }
    }
  }
  
  void stickRelease(int idplayer) {
    sticky = false;
    if ((stickOn == 1) && (idplayer == 1)) {
      movY = player1.getMovY(); 
      movX = 5;
      stickOn = 0;
    } else if ((stickOn == 2) && (idplayer == 2)) {
      movY = player2.getMovY(); 
      movX = -5;
      stickOn = 0;
    }    
  }
  
  void setSticky(int _playerId) {
    sticky = true;
    stickOn = _playerId;  
  }
  
  float getPosY() {
    return posY;
  }
  
  void draw() {
    update();
    ellipse(posX, posY, size, size);
  }
}

