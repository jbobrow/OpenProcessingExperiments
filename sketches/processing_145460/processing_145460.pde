
ArrayList<Squat> hours;
ArrayList<Squat> minutes;
ArrayList<Squat> seconds;
float len, posx;
float lenHour;
float lifetimes, lifetimem, lifetimeh;
float sOld, mOld, hOld;
color cs = color(0, 255, 215);
color cm = color(10, 255, 175);
color ch = color(20, 255, 135);

void setup(){
  size(300,300);
  hours =  new ArrayList<Squat>();
  minutes = new ArrayList<Squat>();
  seconds = new ArrayList<Squat>();
  len = height/30;
  lenHour = height/24;
  sOld = second();
  mOld = minute();
  hOld = hour();
  setupClock();
  posx = width/6;
}

void draw(){
  background(255);
  updateSecond();
  updateMinute();
  updateHour();

  for(Squat s : seconds){
   s.run();
  }
  
  for(Squat m : minutes){
   m.run(); 
  }
  
   for(Squat h : hours){
   h.run(); 
  }
}

void updateSecond(){
  lifetimes = second();
  if(sOld!=lifetimes){
    if(lifetimes%2==0){
      PVector pos = new PVector(4*width/5, (height-len)-len*(lifetimes/2));
      seconds.add(new Squat(pos, len, cs));
    }else{
      PVector pos = new PVector(3*width/5, (height-len)-len*((lifetimes-1)/2));
      seconds.add(new Squat(pos, len, cs));
  }if(lifetimes==0){
     seconds = new ArrayList<Squat>(); 
     PVector pos = new PVector(4*width/5, (height-len)-len*lifetimes);
     seconds.add(new Squat(pos, len, cs));
    }
  }
  sOld = lifetimes;
}

void updateMinute(){
  lifetimem = minute();
  if(mOld!=lifetimem){
    if(lifetimem%2==0){
      PVector pos = new PVector(2*width/5, (height-len)-len*(lifetimem/2));
      minutes.add(new Squat(pos, len, cm));
    }else{
      PVector pos = new PVector(width/5, (height-len)-len*(lifetimem-1)/2);
      minutes.add(new Squat(pos, len, cm));
    }if(lifetimem==0){
      minutes = new ArrayList<Squat>(); 
       PVector pos = new PVector(2*width/5, (height-len)-len*lifetimem);
      minutes.add(new Squat(pos, len, cm));
    }
  }
  mOld = lifetimem;
}

void updateHour(){
    lifetimeh = hour();
    if(hOld!=lifetimeh){
      PVector pos = new PVector(0, (height-lenHour)-lenHour*lifetimeh);
      hours.add(new Squat(pos, lenHour, ch));
    }
    if(lifetimeh==0){
      hours = new ArrayList<Squat>(); 
      PVector pos = new PVector(0, (height-lenHour)-lenHour*lifetimeh);
      hours.add(new Squat(pos, lenHour, ch));
    }
  hOld = lifetimeh;
}


void setupClock(){
  for(int i=0; i<=sOld; i++){
    if(i%2==0){
      PVector pos = new PVector(4*width/5, (height-len)-len*(i/2));
      seconds.add(new Squat(pos, len, cs));
    }else{
      PVector pos = new PVector(3*width/5, (height-len)-len*((i-1)/2));
      seconds.add(new Squat(pos, len, cs));
    }
  }
  
  for(int i=0; i<=mOld; i++){
        if(i%2==0){
      PVector pos = new PVector(2*width/5, (height-len)-len*(i/2));
      minutes.add(new Squat(pos, len, cm));
    }else{
      PVector pos = new PVector(width/5, (height-len)-len*(i-1)/2);
      minutes.add(new Squat(pos, len, cm));
    }
  }
  
  for(int i=0; i<=hOld; i++){
      PVector pos = new PVector(0, (height-lenHour)-lenHour*i);
      hours.add(new Squat(pos, lenHour, ch));
  }

}
class Squat{
 PVector location;
 float hig;
 float leng;
 PVector start;
 PVector velocity = new PVector(0, 10);
 color c;
 
 Squat(PVector location, float hig, color c){
  this.location = location;
  this.hig = hig;
  this.leng = width/5-10;
  start = new PVector(location.x, 0);
  this.c = c;
  //c = color(0, 255, 215);
 } 
  
  
  void run(){
  display();
  update();  
  }
  
  void display(){
    if(start.y<location.y){
      stroke(255);
      //noStroke();
      fill(c);
      rect(start.x, start.y, leng, hig);
    }else{
      stroke(255);
      //noStroke();
      fill(c);
      rect(location.x, location.y, leng, hig);
    }
      
  }
  
  void update(){
    start.add(velocity);
  }

}


