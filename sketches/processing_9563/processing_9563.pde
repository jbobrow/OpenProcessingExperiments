
class bullet{
  float xPos;
  float yPos;
  float speed=10;
  boolean tripped=false;
  void start(){
    xPos=myTraveler.xPos;
    yPos=myTraveler.yPos;
    tripped=true;

  }

  void display(){
    if(tripped){

      fill(random (255),random (255),random (255));

      ellipse(xPos+25,yPos+25,7,7);
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


