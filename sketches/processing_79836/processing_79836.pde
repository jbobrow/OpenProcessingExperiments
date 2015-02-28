
void setup(){
  size(255,255);
  frameRate(10);
}
int x=0,y=0,r=153,b=0;
void draw(){
  stroke (r,255,b);
  line (0,y,x,255);
  r=r+1;
  b=b+3;
  x=x+3;
  y=y+3;
  draw1();
}
int y1=0,x1=255;
void draw1(){
  line (255,y1,x1,255);
  x1=x1-3;
  y1=y1+3;
  draw2();
}
int y2=255,x2=0;
void draw2(){
  line (0,y2,x2,0);
  x2=x2+3;
  y2=y2-3;
  draw3();
}
int y3=255,x3=255;
void draw3(){
  line (255,y3,x3,0);
  x3=x3-3;
  y3=y3-3;
}



