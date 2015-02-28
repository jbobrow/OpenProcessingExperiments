
class Balloon{
  float posX;
  float posY;
  Balloon(float xPos, float yPos){
    posX = xPos;
    posY = yPos;
  }
  void dibuixaGlobo(){
    imageMode(CENTER);
    if((((int)(alterimage/300))%2)==0){
      image(balloondreta,posX,posY);
    }else{
      image(balloonesquerra,posX,posY);
    }
    alterimage += 1;
 
    //48 x 78
    //48 x 56
  }
  void dibuixaPum(){
   
  }
   
  void moure(){
    if(alter%12==0){
      posX+=2;
    }else if(alter%15==0){
      posX-=1;
    }
    alter+=1;
     
    if(posY>-20){
      posY-=0.5;
    }else{
      posY=430;
    }
     
    if(posX>415){
      posX=0;
    }else if(posX<-15){
      posX=400;
    }
  }
  void pum(){
    if(mouseX>posX-(balloondreta.width/2) && mouseX<posX+(balloondreta.width/2) && mouseY>posY-(balloondreta.height/2)-11 && mouseY<posY+(balloondreta.height/2)-11){
      print("ok");
      score.puntua();
      transpa = 255;
      x = mouseX+random(-25,25);
      y = mouseY+random(-25,25);
    }
     
  }
}

