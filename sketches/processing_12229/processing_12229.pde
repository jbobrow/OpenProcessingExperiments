
String dayN,theL,stone,seems2,free,his,mind,at,night,hesA,alone,throughT,dayNite,lonelyL,kidCudi,someT,neverC;

void chorus(int start){ 
  if (millis()>start && millis()<(start+13500)){
    dayN();
  }
  if (millis()>(start+2000) && millis()<(start+13500)){ 
    theL();
  }
  if (millis()>(start+2500) && millis()<(start+5000)){
    upX = -1;
    if (upY<0.0125){
      upY = 0;
    }
    upY = upY/1.5;
  }
  if (millis()>(start+2500) && millis()<(start+13500)){
    rotate(HALF_PI);
    stone();
    if (stone!=null && stone.equals("STONER")){
      seems2();
    }
    if (seems2!=null && seems2.equals("SEEMS TO")){
      free();
    }
    if (free!=null && free.equals("FREE")){
      his();
    }
    if (his!=null && his.equals("HIS")){
      mind();
    }
    if (mind!=null && mind.equals("MIND")){
      at();
    }
    if (at!=null && at.equals("AT")){
      night();
    }
    if (night!=null && night.equals("NIGHT")){
      rotate(-HALF_PI);
      hesA();
    }
  }
  if (millis()>(start+5000) && millis()<(start+9000)){
    if (upX>-0.0125){
      upX = 0;
    }
    upX = upX/1.5;
    upY = 1;
  }
  if (millis()>(start+5000) && millis()<(start+13500)){
    pan = 300;
    span = 300;
    if (hesA!=null && hesA.equals("HE'S ALL")){
      alone();
    }
    if (alone!=null && alone.equals("ALONE")){
      throughT();
    }
    if (throughT!=null && throughT.equals("THROUGH THE")){
      dayNite();
    }
  }
  if (millis()>(start+9000) && millis()< (start+13500)){
    upX = 1;
    if (upY<0.0125){
      upY = 0;
    }
    upY = upY/1.5;
    pan = 600;
    span = 200;
  }
  if (millis()>(start+9000) && millis()<(start+13500)){ 
    if (dayNite!=null && dayNite.equals("DAY'N'NIGHT")){
      rotate(-HALF_PI);
      lonelyL();
    }
  }
  if (millis()>(start+13500) && millis()<(start+14000)){
      dayN = null;
      theL = null;
      stone = null;
      seems2 = null;
      free = null;
      his  = null;
      mind = null;
      at = null;
      night = null;
      hesA = null;
      alone = null;
      throughT = null;
      dayNite = null;
      lonelyL = null;
      kidCudi = null;
      neverC = null;
      pan = 0;
      span = 0;
      upY = 1;
      upX = 0;
  }
  if (millis()>(start+14000)){
    dayN();
  }
  if (millis()>(start+16000)){ 
    theL();
  }
  if (millis()>(start+16500) && millis()<(start+18000)){
    upX = -1;
    if (upY<0.0125){
      upY = 0;
    }
    upY = upY/1.5;
  }
  if (millis()>(start+16500)){
    rotate(HALF_PI);
    stone();
    if (stone!=null && stone.equals("STONER")){
      seems2();
    }
    if (seems2!=null && seems2.equals("SEEMS TO")){
      free();
    }
    if (free!=null && free.equals("FREE")){
      his();
    }
    if (his!=null && his.equals("HIS")){
      mind();
    }
    if (mind!=null && mind.equals("MIND")){
      at();
    }
    if (at!=null && at.equals("AT")){
      night();
    }
    if (night!=null && night.equals("NIGHT")){
      rotate(-HALF_PI);
      hesA();
    }
  }
  if (millis()>(start+19000) && millis()<(start+22000)){
    if (upX>-0.0125){
      upX = 0;
    }
    upX = upX/1.5;
    upY = 1;
  }
  if (millis()>(start+19000)){
    pan = 300;
    span = 300;
    if (hesA!=null && hesA.equals("HE'S ALL")){
      alone();
    }
    if (alone!=null && alone.equals("ALONE")){
      someT();
    }
    if (someT!=null && someT.equals("SOME THINGS WILL")){
      neverC();
    }
  }
  if (millis()>(start+23000) && millis()< (start+27000)){
    upX = 1;
    if (upY<0.0125){
      upY = 0;
    }
    upY = upY/1.5;
    pan = 600;
    span = 200;
  }
  if (millis()>(start+23000)){ 
    rotate(-HALF_PI);
    lonelyL();
  }
}

