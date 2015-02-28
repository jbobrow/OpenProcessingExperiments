
/*class BabyBunny{
 
 PImage boybaby;

  int babyboyposX;
  int babyboyposY;

  int babySpeedX;
  int babySpeedY;
  
  BabyBunny(int tempbabyboyposX, int tempbabyboyposY, int tempbabySpeedX, int tempbabySpeedY){
    babyboyposX = tempbabyboyposX;
    babyboyposY = tempbabyboyposY;
    babySpeedX = tempbabySpeedX;
    babySpeedY = tempbabySpeedY;
    
  }
}
  
  void birth(){
    boybaby = loadImage("boybaby.png");
    image(boybaby, babyposX, babyposY);
    
  }
  
  void bounce(){
    //don't want it to go out of bounds?
    if(boyposX > width - 10){
      babySpeedX = babySpeedX*(-1);
      babySpeedY = babySpeedY*(-1);
    }
    if(boyposX < 0){
      babySpeedX = babySpeedX*(-1);
      babySpeedY = babySpeedY*(-1);
    }
     if (boyposY > height || boyposY < 0){
      babySpeedX = babySpeedX*(-1);
      babySpeedY = babySpeedY*(-1);
    }
       babyboyposX += babySpeedX;
      babyboyposY += babySpeedY;
     
  
  }
*/


