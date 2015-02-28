
class bullet{
  float xPos=0;
  float yPos=0;
  float speed=40;
  boolean tripped=false;

  void start(){
    xPos=myBaseShip.xPos;
    yPos=myBaseShip.yPos;
    tripped=true;
  }

  void display(){
    if(tripped){
      noStroke();
      fill(255);
      ellipse(xPos+25,yPos,6,3);
    }

  }

  void move(){
    if(tripped){
      yPos-=speed;
      if(yPos <= -10){
        tripped=false;
      }
    } 
  } 
}




