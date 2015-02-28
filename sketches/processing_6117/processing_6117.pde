
PImage lichen;
PImage moss;
PImage ladybug;
PImage crab;
PImage dude;
int x;
int y;
int speed;
int yspeed;
int a;
int b;
int aspeed;
int bspeed;
int c;
int d;
int cspeed;
int dspeed;
int e;
int f;
int espeed;
int fspeed;
int duderun;
int dudespeed;


void setup(){
  size(1100,700);
  x = 0;
  y = 0;
  speed = 5;
  yspeed = round(random(20));
  a=500;
  b=0;
  aspeed=8;
  bspeed =round(random(30));
  c=800;
  d=50;
  cspeed=4;
  dspeed=4;
  e=1000;
  f=0;
  espeed=7;
  fspeed= round(random(40));
  duderun=550;
  dudespeed=round(random(12));

  lichen = loadImage("IMG_5515.jpg");
  moss = loadImage("IMG_5520.jpg");
  ladybug = loadImage("IMG_5521.jpg");
  crab = loadImage("IMG_5518.jpg");
  dude = loadImage("bs_logo.jpg");
}

void draw(){
  background(220);
  line(420,0,420,600);
  image(lichen,x,y);
  x=x+speed;
  y=y+yspeed;

  if (x > 95){
    speed = -5;
  }
  if (x < -8){
    speed = 5;
  }
  if (y > 390){
    yspeed = yspeed * -1;
  }
  if (y < -8){
    yspeed = 8;
  }

  line (700,0,700,600);
  image(moss,a,b);
  a=a+aspeed;
  b=b+bspeed;

  if (a > 495){
    aspeed = -8;
  }
  if (a < 425){
    aspeed = 8;
  }
  if (b > 500){
    bspeed =bspeed * -1;
  }
  if (b < 0){
    bspeed = 8;
  }
  
  line (820,0,820,600);
  image(ladybug,c,d);
  c=c+cspeed;
  d=d+dspeed;

  if (c > 740){
    cspeed = -8;
  }
  if (c < 710){
    cspeed = 8;
  }
  if (d > 600){
    dspeed =-4;
  }
  if (d < 0){
    dspeed = 4;
  }
  
  image(crab,e,f);
  e=e+espeed;
  f=f+fspeed;

  if (e > 850){
    espeed = -5;
  }
  if (e < 830){
    espeed = 5;
  }
  if (f > 450){
    fspeed = fspeed * -1;
  }
  if (f < 5){
    fspeed = 8;
  }
  
  image(dude,duderun,600);
  duderun=duderun+dudespeed;
  
  if (duderun >1020){
    dudespeed =dudespeed*-1;
  }
  if (duderun< 10){
    dudespeed = round(random(8));
  }
  
  
  

}





