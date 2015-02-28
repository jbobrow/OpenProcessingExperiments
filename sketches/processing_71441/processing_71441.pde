
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=0;
int i=0;
int j=0;
int k=0;
int l=0;
int m=0;
int n=0;
int o=0;
int p=0;
int q=0;
float r=0;
int s=0;
int t=0;
int u=0;
int v=0;
float w=0;
float x=0;
int y=0;
int z=0;
 
/**
w = move up
a = move left
s = move down
d = move right
spacebar = shoot ball
r= reload
*/
 
void setup()
{
  size(400, 400);
  fill(255);
  rect(0, 0, 500, 500);
  frameRate(30);
}
void draw()
{
  fill(0);
  rect(0, 0, 500, 500);
  fill(230,220,0);
  frameRate(100);
  ellipse(200+c, 240+d, 20, 20);
  fill(50, 100, 5);
  ellipse(200+a, 270+b, 80, 80);
  fill(70, 130, 5);
  ellipse(200+a, 270+b, 50, 50);
  fill(30, 65, 0);
  quad(190+a, 210+b, 190+a, 270+b, 210+a, 270+b, 210+a, 210+b);
  d=d+e;
  if (240+d>270+b)
  {
    d=b;
  }
  if (240+d<0)
  
    ellipse(200+c, 240+d, 20, 20);
   stroke(255-n, 50+n, 50+n);
  fill(255-n, 50+n, 50+n);
  n=n+o;
   if (n>150)
  {
    o=-2;
  }
  if (n<0)
  {
    o=2;
  }
      ellipse(15+f, 15, 20, 20);
  ellipse(355+h, 55, 20, 20);
  ellipse(155+i, 95, 20, 20);
  ellipse(105+j,105, 20, 20);
  ellipse(350+p, 75, 20, 20);
  f=f+e;
  h=h+k;
  i=i+l;
  j=j+m;
  p=p+q;
    if (f>375)
  {
    e=-5;
  }
  if (f<-5)
  {
    e=5;
  }
  if (h>30)
  {
    k=-5;
  }
  if (h<-340)
  {
    k=5;
  }
  if (i>225)
  {
    l=-5;
  }
  if (i<-140)
  {
    l=5;
  }
  if (j>275)
  {
    m=-5;
  }
  if (j<-90)
  {
    m=5;
  }
  if (p>30)
  {
    q=-5;
  }
  if (p<-330)
  {
    q=5;
  }
}
void keyPressed()
{
  if (key=='a')
  {
    a=a-10;
    c=c-10;
  }
  if (key=='s')
  {
    b=b+10;
    d=d+10;
  }
  if (key=='d')
  {
    a=a+10;
    c=c+10;
  }
  if (key=='w')
  {
    b=b-10;
    d=d-10;
  }
  if (key==' ')
  {
    e=-30;
  }
  if (key=='r')
  {
    e=700;
  }
   if (key=='m')
  {
    e=5;
    k=5;
    l=5;
    m=5;
    q=5;
  }
    if (key=='c')
  {
    o=2;
  }
}
