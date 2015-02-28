
int x1=0;
int y1=0;
int x2=5;
int y2=5;
int x3=600;
int y3=600;
int x4=5;
int y4=5;
int a=0;
int b=600;
int c=5;
int d=5;
int a2=600;
int b2=0;
int c2=5;
int d2=5;
void setup(){
  size(600,600);
  noFill();
  frameRate(18);
  background(#000000);
  stroke(#03CEFF);
 }
void draw(){
  x1=x1+5;
  y1=y1+5;
  x2=x2+5;
  y2=y2+5;
  x3=x3-5;
  y3=y3-5;
  x4=x4+5;
  y4=y4+5;
  a=a+5;
  b=b-5;
  c=c+5;
  d=d+5;
  a2=a2-5;
  b2=b2+5;
  c2=c2+5;
  d2=d2+5;
  ellipse(x1,y1,x2,y2);
  ellipse(x3,y3,x4,y4);
  ellipse(a,b,c,d);
  ellipse(a2,b2,c2,d2);
  
}
  
  
 



