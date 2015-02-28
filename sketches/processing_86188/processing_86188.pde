
class explosions {
  float posX, posY;
  float moveX, moveY;
  int myH,myS,myB;
  int frameLife;
    
  explosions(int setH,int setS,int setB) {
    posX = (int)random(width);
    posY = (int)random(height);
    
    float randSpeed = random(0.8,3.0);
    float randAng = random(0.0,2.0*PI);
    moveX = random(-3.0,3.0);
    moveY = random(-3.0,3.0);

    frameLife = (int)random(12,58);

    myH = setH;
    myS = setS;
    myB = setB;
  }
  
  void moveAndDrawThisOne() {
    frameLife--;
    
    fill(myH,myS,myB,255);
    posX += moveX;
    posY += moveY;
    
    moveY += 0.05;
    
    if(posX < 0) {
      posX = width;
    }
    if(posX > width) {
      posX = 0;
    }
    if(posY > height) {
      moveY = -0.8*moveY;
    }
    
    ellipse(posX,posY,3,3);
  } 
}

