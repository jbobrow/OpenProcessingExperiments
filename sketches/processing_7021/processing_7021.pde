
class Motiv {
  float mposx,mposy;


  Motiv(float x, float y){
    mposx = x;
    mposy = y;

  }

  void motivDraw() {
    noFill();
    strokeWeight(6);
    stroke(255,0,0);

    point(mposx, mposy);



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

  

}











