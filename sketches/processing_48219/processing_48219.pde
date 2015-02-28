
class Snow
{
  float sz = 5;
  float x,y;
  float speedX=0, speedY=0;
  float trans;
   
  void startSnow(){ 
      fill(255,10);
      x = random(0, width);
      y = random(-1200,0);
      trans = random(130,250);
      while (speedX == 0 || speedY ==0) {
       speedX = random(-.3, .3);
       speedY = random(1.1, 1.9);
      }   
  }
 
 void resetSnow(){
  if(y > height)
    startSnow();
 } 
 
}


