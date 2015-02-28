
class Ball{
//Variables
  protected float posX, posY, prevPosX, prevPosY;
  protected float velX, velY;
  
  //////Constructor
  Ball(float pPosX,float pPosY){
    posX=prevPosX=pPosX;
    posY=prevPosY=pPosY;
    velX=0;
    velY=0;
  }
 ////////Procesos
  void update(float pGravity){
    prevPosX=posX;
    prevPosY=posY;
    velY+=pGravity;
    posX+=velX;
    posY+=velY;
  }
  void display(PGraphics Buffer){
    
    Buffer.stroke(0,255,0);
    Buffer.strokeWeight(2);
    Buffer.line(prevPosX,prevPosY,posX,posY);
    Buffer.strokeWeight(2);
    Buffer.point(posX,posY);
  }
  
  void BounceFloor(float pBounce){
    velY=-velY*pBounce;
  }
    void BounceFence(float pBounce){
    velX=-velX*pBounce;
  }
  ////////Accesos
  void setSpeed(float pVelX,float pVelY){
    velX=pVelX;
    velY=pVelY;
  }
  void setPosition(float pPosX,float pPosY){
    posX=pPosX;
    posY=pPosY;
  }  
    void setPrevPosition(float pPosX,float pPosY){
    prevPosX=pPosX;
    prevPosY=pPosY;
  }  
}

