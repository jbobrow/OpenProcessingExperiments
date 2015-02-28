
void setup(){
  
  size(700,400);
  background(255);
  
  
}
/*
float secs = map(second(), 0, 60, 0, 360);
float mins = map(minute(), 0, 60, 0, 360);
float hrs = map(hour() % 12, 0, 12, 0, 360);
*/

float s;
float m;
float h;

float sect = 1;
float mint = 1;
float hrst = 1;

float xs = 0;
float xm = 0;

float timepast = 0;
float speed;

void draw(){
  
  background(255);
  
  float s = second();
  float m = minute() * 60;
  float h = hour() * 3600;

  float time = s + m + h;
  
  
  float ss;
  float mm;
  float hh;
  
  time = time + speed;
  
  hh = time / 60 / 60;
  mm = time / 60;
  ss = time;

  float secs = map(ss, 0, 86400, 0, 518400);
  float mins = map(mm, 0, 1440, 0, 8640);
  float hrs = map(hh, 0, 24, 0, 720);

  translate(width/2,height/2);
  rotate(radians(-90));
  
//  secs = secs * sect;
  

  
 // mins = mins * mint;
 // hrs = hrs * hrst;
  
  line(0,0,cos(radians(secs))*500, sin(radians(secs))*500);
  line(0,0,cos(radians(mins))*200, sin(radians(mins))*200);
  line(cos(radians(hrs))*5, sin(radians(hrs))*5,cos(radians(hrs))*100, sin(radians(hrs))*100);
  
  float opac = map(speed,0,100000,0,100);
  float col = map(speed,100000,10000000,0,255);
  fill(255-col,127-(col/2),0,opac);
  
  ellipse(cos(radians(hrs))*100,sin(radians(hrs))*100,50,50);
  
  timepast = time;
  
  if (xs == 0){
    if (speed > 1){
      speed = speed * 0.99;
    } else {
      speed = 1;
    }}
  else{xs = xs - 1; speed = speed * (1 - ((100-xs)/10000));}
}

void mouseClicked(){
  if (speed<100000){
    speed = speed * 1.1;
  }else{speed = 10000;}xs = 130;
}

