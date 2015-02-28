
int ratio;

int bottom;
int top;
int right;
int left;

int wdth;
int hght;

Ball aBall;
Ball aBall2;
Ball aBall3;
Ball aBall4;
Ball aBall5;


void setup () {
  
  background(255);
  
  int ratio = 1000;
  wdth = round (ratio * 1.4);
  hght = ratio;
  
  size (wdth,hght);

  bottom = height;
  top = 0;
  left = 0;
  right = width;

  frameRate(60);

  aBall = new Ball (100,100);
  aBall2 = new Ball (400,150);
  aBall3 = new Ball (700,200);
  aBall4 = new Ball (1000,250);
  aBall5 = new Ball (1300,300);
}
void draw() {
  fill(0,0,255,25);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
  
  
  smooth();

  aBall.drawThis();
  aBall2.drawThis();
  aBall3.drawThis();
  aBall4.drawThis();
  aBall5.drawThis();
  
}

