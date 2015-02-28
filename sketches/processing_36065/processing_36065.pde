
int clocka;

PGraphics clock;
PGraphics clockb1;
PGraphics clockb2;
PGraphics clockb3;
PGraphics clockb4;
PGraphics clockb5;
PGraphics clockb6;
PGraphics sun;
PGraphics ground;

void setup(){
  
  size(700,400);
  background(255);
  smooth();
  
  clock = createGraphics(700,400,P2D);
  clockb1 = createGraphics(700,400,P2D);
  clockb2 = createGraphics(700,400,P2D);
  clockb3 = createGraphics(700,400,P2D);
  clockb4 = createGraphics(700,400,P2D);
  clockb5 = createGraphics(700,400,P2D);
  clockb6 = createGraphics(700,400,P2D);
  ground = createGraphics(700,400,P2D);
  
  noStroke();
  fill(150,150,255);
  rect(0,0,width,height/2);
  fill(5,5,20);
  rect(0,height/2,width,height/2);
}
/*
float secs = map(second(), 0, 60, 0, 360);
float mins = map(minute(), 0, 60, 0, 360);
float hrs = map(hour() % 12, 0, 12, 0, 360);
*/

int a = 1;

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
  
  noStroke();
  fill(150,150,255,30);
  rect(0,0,width,height/2);
  fill(5,5,20,30);
  rect(0,height/2,width,height/2);
  
  ground.beginDraw();
  
  ground.noStroke();
  ground.fill(128,50,50);
  ground.rect(0,height/2,width,height/2);
  ground.fill(255);
  ground.ellipse(width/2,height/2,130,130);
  
  ground.endDraw();


  if (a == 1){
    fill(255);
    ellipse(700/2,400/2,142,142);
    a = 0;}

  smooth();

  stroke(255,2);
  strokeWeight(11);
  fill(255,20);
  ellipse(700/2,400/2,120,120);
  
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
  stroke(0);
  strokeWeight(1);
  line(0,0,cos(radians(secs))*65, sin(radians(secs))*65);
  strokeWeight(2);
  line(cos(radians(mins))*5, sin(radians(mins))*5,cos(radians(mins))*36, sin(radians(mins))*36);
  line(cos(radians(hrs))*5, sin(radians(hrs))*5,cos(radians(hrs))*20, sin(radians(hrs))*20);
  
  float opac = map(speed,0,50000,10,100);
  float col = map(speed,100000,10000000,0,255);
  fill(255-col,127-(col/2),0,opac);
  stroke(255,127,0);
  ellipse(cos(radians(mins))*51,sin(radians(mins))*51,24,24);
  strokeWeight(1);
  ellipse(cos(radians(hrs))*30,sin(radians(hrs))*30,16,16);
  //fill(255,170,0,10);
  noFill();
  ellipse(cos(radians((hrs/2)-180))*150,tan(radians((hrs/2)-180))*100,40,40);
  
//  endDraw();

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
  }xs = 130;
}

