
float x=0;
float y=0;

float speedX=5;
float speedY=0;
float gravity=.95;

PImage bg1;
PImage bg2;
PImage bg3;
PImage giraffe;

float xBg1=-200;
float xBg2=0;
float xBg3=-100;

float speedBg1=3;
float speedBg2=5;
float speedBg3=3;


float xBlimp=-100;
float xBlimp2=-100;
float xBlimp3=-100;
float speedBlimp=4;
float speedBlimp2=5;
float speedBlimp3=3;

PImage blimp;
PImage blimp2;
PImage blimp3;

void setup(){
  size(1800,600);
  frameRate(24);
  
  bg3=loadImage("bg3.png");
  bg2=loadImage("bg2.png");
  bg1=loadImage("bg1.png");
  
  blimp3=loadImage("blimp3.png");
  blimp2=loadImage("blimp2.png");
  blimp=loadImage("blimp.png");
  
  giraffe=loadImage("giraffe.png");
}

void draw() {
  
  background(2,145,255);
  if (x>2100){
    x=-100;
  }
  if (xBlimp>2100){
    xBlimp=-100;
  }
  if (xBlimp2>2100){
    xBlimp2=-100;
  }
  if (xBlimp3>2100){
    xBlimp3=-100;
  }
  
  image(bg3,xBg3,0);
  xBg3=xBg3+speedBg3;
  if ((xBg3>0)||(xBg3<-200)){
    speedBg3=speedBg3*-1;
  }
 
  image(bg2,xBg2,0);
  xBg2=xBg2+speedBg2;
  if ((xBg2>0)||(xBg2<-200)){
    speedBg2=speedBg2*-1;
  }
  
  image(bg1,xBg1,0);
  xBg1=xBg1+speedBg1;
  if ((xBg1>0)||(xBg1<-200)){
    speedBg1=speedBg1*-1;
  }
  
  
  
  image(blimp3,xBlimp3,75);
  xBlimp3=xBlimp3+speedBlimp3;
  
 
  image(blimp2,xBlimp2,10);
  xBlimp2=xBlimp2+speedBlimp2;
  
  
  
  image(blimp,xBlimp,50);
  xBlimp=xBlimp+speedBlimp;
  
  
  
  y=y+speedY;
  
  speedY=speedY+gravity;
  x=x+speedX;
  
  image(giraffe,x,y-100);
  if(y>height){
    speedY=speedY*-.95;
  }
  
  
}

