
class Motiv {
  float mposx,mposy;
  float speedx, speedy;
  boolean bounce;
  boolean secMot;

  Motiv(float x, float y, float spdx, float spdy, boolean b, boolean sm){
    mposx = x;
    mposy = y;
    speedx = spdx;
    speedy = spdy;
    bounce = b; 
    secMot = sm;
  }

  void motivDraw() {
    mposx += speedx/4;
    mposy += speedy/4;
    noFill();
    strokeWeight(6);
    if (secMot == true){
      stroke(255,0,0);
    } 

    else { 
      stroke(0,0,255);
    }

    point(mposx, mposy);

    if(bounce == false){
      if(mposx<0){
        mposx = width;
      }
      if(mposx>width){
        mposx = 0;
      }
      if(mposy>height){
        mposy = 0;
      }
      if(mposy<0){
        mposy = height;
      }
    }
    else {
      if(mposx<0 || mposx>width){
        speedx *=-1; 
      }
      if(mposy<0 || mposy>height){
        speedy *=-1; 
      }



    }

  }

  float giveMotivx(){
    return mposx;
  }

  float giveMotivy(){
    return mposy;
  }

  void setMotivPos(float x, float y){
    mposx = x;
    mposy = y;
  }

  void setMotivSpd(float sx, float sy){
    speedx = sx;
    speedy = sy;
  }

  void bounce(){
    bounce = true;
  }

  void repeat(){
    bounce = false;
  }

}








