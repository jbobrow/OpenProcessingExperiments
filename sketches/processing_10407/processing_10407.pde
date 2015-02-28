
class Missile{
  PImage missileImage;
  PVector pos;
  PVector vel;
  float speed;
  float direction;

  Missile(PVector pPosition, float pDirection){
    pos=new PVector(pPosition.x,pPosition.y);
    direction=pDirection;
    speed=2;
    vel=new PVector(cos(direction)*speed,sin(direction)*speed);
    missileImage=loadImage("torpedo.png");
  }

  void display(PGraphics pBuffer){
    pBuffer.pushMatrix();
    pBuffer.noStroke();
    pBuffer.translate(missileImage.width/2,missileImage.height/2);
    pBuffer.translate(pos.x-missileImage.width/2,pos.y-missileImage.height/2);
    pBuffer.rotate(HALF_PI+direction);
    pBuffer.translate(-missileImage.width/2,-missileImage.height/2);
    pBuffer.image(missileImage,0,0);
    pBuffer.popMatrix();
    
    stroke(0,255,0);
    strokeWeight(4);
    point(pos.x,pos.y);
  }

  boolean update(float pWidth, float pHeight,PGraphics pBuffer){
    pos.add(vel);
    
    if(pos.x>pWidth+100||pos.y>pHeight+100||pos.x<-100||pos.y<-100){
      return false;
    }
    return true;
  }

}





