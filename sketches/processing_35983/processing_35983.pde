
void setup(){
  
  size(700,400);
  background(255);
  
  
}
/*
float secs = map(second(), 0, 60, 0, 360);
float mins = map(minute(), 0, 60, 0, 360);
float hrs = map(hour() % 12, 0, 12, 0, 360);
*/
float sect;
float mint;
float hrst;

void draw(){
  
  background(255);
  
  float secs = map(second(), 0, 60, 0, 360);
  float mins = map(minute(), 0, 60, 0, 360);
  float hrs = map(hour() % 12, 0, 12, 0, 360);
  
  translate(width/2,height/2);
  rotate(radians(-90));
  
  line(0,0,cos(radians(secs))*500, sin(radians(secs))*500);
  line(0,0,cos(radians(mins))*200, sin(radians(mins))*200);
  line(0,0,cos(radians(hrs))*150, sin(radians(hrs))*150);
  

  
  
}

