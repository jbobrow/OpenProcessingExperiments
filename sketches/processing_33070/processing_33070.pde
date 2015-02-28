
PImage bkround;
int x=80;
int y=400;
float diam=90;
int yspeed=5;


int xb=270;
int yb=400;
int ybspeed=5;

int xc=460;
int yc=400;
int ycspeed=5;

int xd=650;
int yd=400;
int ydspeed=5;

void setup()
{
  size (700,525);
  frameRate(40);
  bkround=loadImage("bkground.jpg");
}

void draw()
{
  background(bkround);
  y=y-yspeed;
  noStroke();
  ellipse (x, y, diam, diam);
  fill(0,0,250);
  ellipse (x, y+diam*2, diam, diam);
  fill(0,250,0);
  ellipse (x, y+diam*4, diam, diam);
  fill(0,0,250);
  ellipse (x, y+diam*6, diam, diam);
  fill(0,250,0);
  ellipse (x, y+diam*8, diam, diam);
  //second row
  yb=yb-ybspeed;
  ellipse (xb, yb+diam*2, diam, diam);
  fill(0,0,250);
  ellipse (xb, yb, diam, diam);
  fill(0,250,0);
  ellipse (xb, yb+diam*6, diam, diam);
  fill(0,0,250);
  ellipse (xb, yb+diam*4, diam, diam);
  fill(0,250,0);
  ellipse (xb, yb+diam*8, diam, diam);
  fill(0,0,250);
   //third row
  yc=yc-ycspeed;
  ellipse (xc, yc+diam*2, diam, diam);
  fill(0,250,0);
  ellipse (xc, yc, diam, diam);
  fill(0,0,250);
  ellipse (xc, yc+diam*6, diam, diam);
  fill(0,250,0);
  ellipse (xc, yc+diam*4, diam, diam);
  fill(0,0,250);
  ellipse (xc, yc+diam*8, diam, diam);
  fill(0,250,0);
  //fourth row
  yd=yd-ydspeed;
  ellipse (xd, yd, diam, diam);
  fill(0,0,250);
  ellipse (xd, yd+diam*2, diam, diam);
  fill(0,250,0);
  ellipse (xd, yd+diam*4, diam, diam);
  fill(0,0,250);
  ellipse (xd, yd+diam*8, diam, diam);
  fill(0,250,0);
  ellipse (xd, yd+diam*6, diam, diam);
  fill(0,0,250);
 

 }

