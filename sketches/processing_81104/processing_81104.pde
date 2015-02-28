
int x=50;
int y=50;
int x1=250;
int y1=250;
int x2=250;
int y2=50;
int x3=50;
int y3=250;
int r=0;
int g=20;
int b=15;
void setup(){
  size(300,300);
  fill(r,g,b);
}
void draw(){
  ellipse(x,y,50,50);
  ellipse(x1,y1,50,50);
  ellipse(x2,y2,50,50);
  ellipse(x3,y3,50,50);
}
void keyPressed(){
  x=x+1;
  y=y+1;
  x1=x1-1;
  y1=y1-1;
  x2=x2-1;
  y2=y2+1;
  x3=x3+1;
  y3=y3-1;
  r=r+3;
  g=g+6;
  b=b+9;
  fill(r,g,b);
}


