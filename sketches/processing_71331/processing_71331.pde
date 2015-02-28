
class Ripple {
  float wradius, wspeed, wposx, wposy, wstrokeWeight;
  int rFlag;
  Ripple(float tempWposx, float tempWposy){
   wposx = tempWposx;
   wposy = tempWposy;
   wradius = random(20,40);
   wspeed = wradius/3; 
   wstrokeWeight = wradius/4;
   rFlag = 1;
  }
  
  void display(){
      stroke(135, 217, 248, 255-5*rFlag);
      strokeWeight(wstrokeWeight);
      if(rFlag<52 && frameCount%2 == 0){
        ellipse(wposx, wposy, wradius + wspeed*rFlag, wradius + wspeed*rFlag); 
      } else if ( rFlag >= 52) {
       // background(0,174,239); 
      }       
      rFlag++;     
  }
}

