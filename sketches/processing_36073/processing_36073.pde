
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

float clickspeed = 1;

float s;
float m;
float h;

float sect = 1;
float mint = 1;
float hrst = 1;

float hrs;
float rot = 0;

float xs = 0;
float xm = 0;

float timepast = 0;
float speed;
float mncr = random(5,15);

void draw(){
  translate(width/2,height/2);
  rotate(rot);
   noStroke();

  if (mncr <= 5){
    mncr = mncr * random(1,1.1);}
  else{
    mncr = mncr * random(0.9,1.1);}

  int mncy = 0;
  int mncx = 0;
  
  while(mncy<20){
    fill(random(240,255),random(230,240),random(170,190),80);

  ellipse(0,mncr*3,mncr,mncr);
  rotate(radians(18));
    mncy=mncy+1;
  }
  translate(-width/2,-height/2);
  
  noStroke();
  fill(150,150,255,30);
  rect(-400,-400,width+800,(height/2)+400);
  fill(5,5,20,30);
  rect(-400,height/2,800+width,(height/2)+400);
  
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
  fill(255,10);
  ellipse(700/2,400/2,120,120);
  fill(200,1);
  int fc = 0;
  noStroke();
  while (fc<10){
    fc = fc + 1;
    ellipse(700/2,400/2,fc*40+120,fc*30+120);}

  
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
  hrs = map(hh, 0, 24, 0, 720);
  
  

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
//  ellipse(cos(radians((hrs/2)-180))*150,tan(radians((hrs/2)-180))*100,40,40);


if (cos(radians((hrs/2)-180))>0){
  translate(cos(radians((hrs/2)-180))*150,tan(radians((hrs/2)-180))*100);
  
  int mx = 0;
  int my = 0;
  int x = 0;
  float xt = 6;

  fill(255,127,0,15);
  noStroke();
  
  int y = 0;
  
  while (y < 10){
    quad(0,0,xt/2+xt/2,0,xt+xt,xt/12+(xt/11),xt/2,xt/12+(xt/11));
    rotate(radians(10));
    
    x = x+10;
    if(x==360){y=y+1;x=0;xt=xt*1.2;rotate(radians(5));}}
}else{
  
  translate(cos(radians((hrs/2)-180))*150,tan(radians((hrs/2)-180))*100);
  
  noStroke();
  fill(255,255,220);
  ellipse(0,0,80,80);
  fill(255,255,190);
  ellipse(5,5,65,65);

  float mncr8;
  int mny = 0;
  int mnx = 0;
  
/*  while(mny<10){
    fill(random(240,255),random(230,240),random(170,190),80);
  mncr8 = random(5,15);
  ellipse(0,mncr8*3,mncr8,mncr8);
  rotate(radians(20));
  mnx=mnx+20;
  if(mnx>=360){
    mny=mny+1;rotate(radians(5));}
 }
 */   
}

//  endDraw();

  timepast = time;
  
  if (xs == 0){
    if (speed > 1){
      speed = speed * 0.99;
    } else {
      speed = 1;
    }}
  else{xs = xs - 1; speed = speed * (1 - ((100-xs)/10000));}
  if (rot >= 0 && rot < (radians(180))){rot = rot*0.99;}
  else {rot = radians(180);speed = 1;


}
  if (clickspeed >1.0){
  clickspeed = clickspeed * random(0.98,1.005);
  int r = 0;
  while (r < 20){
    fill(random(230,255),random(100,150),random(0,30),50);
    ellipse(clickspeed*5,clickspeed*5,clickspeed*3,clickspeed*3);
    r = r+1;
    rotate(radians(18));
  }}
  
}

void sun(){
  
}

int mx = 10;

void mouseClicked(){
  if (speed<100000){
    speed = speed * 1.1;
    mx = 10;
  }xs = 130;
  if (speed>10000){
    mx = 20;
    if (rot < radians(180)){
  rot = rot + ((radians(speed/1000000))*xs/100);}
  }
  if (mouseButton == RIGHT){
    speed = speed * 1.5;    
  }
} 

void mousePressed(){
//  translate(mouseX-350,mouseY-200);
    if(clickspeed>=mx){clickspeed = clickspeed * random(0.95,1.02);}
    else{clickspeed = clickspeed * random (0.99,1.2);}
  int r = 0;
  while (r < 20){
    fill(random(230,255),random(100,150),random(0,30),50);
    ellipse(clickspeed*3.5,clickspeed*3.5,clickspeed*3,clickspeed*3);
    r = r+1;
    rotate(radians(18));
  }
  
//  translate(-mouseX,-mouseY);
}

