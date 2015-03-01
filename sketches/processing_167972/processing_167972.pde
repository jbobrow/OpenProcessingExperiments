
int a=-100;
int b=-40;
int c=-80;
int d=-20;
int e=-70;
int g=40;
int f=100;
int h=80;
int i=20;
int j=70;
int r= #F60B0B ;
int x=1;
int n=0;
int w=255;


void setup()
{
  
  size(600,600);
  frameCount=10;
  }
  void draw()
  {
    
    background( #19B9FC);
  fill( #116F08 );
  noStroke();
  rect(0,400,600,200);
  fill( #D1960D);
  stroke( #543C05);
  rect(60,250,30,160);
  rect(120,250,30,160);
  rect(180,250,30,160);
  rect(240,250,30,160);
  rect(300,250,30,160);
  rect(360,250,30,160);
  rect(420,250,30,160);
  rect(480,250,30,160);
  rect(540,250,30,160);
  rect(600,250,30,160);
  rect(0,270,600,30);
  rect(0,330,600,30);
  fill(r);
  r=r+1;
  stroke(0);
  triangle(c,160,a,104,b,118);
  a=a+1;
  b=b+1;
  c=c+1;
  fill(r);
  r=r+1;
  stroke(0);
  triangle(h,160,f,104,g,118);
  h=h+1;
  f=f+1;
  g=g+1;
  stroke(0);
  ellipse(x,320,320,320);
  x=x+1;
  ellipse(x,200,200,200);
  ellipse(x,240,80,40);
  fill(n);
  n=n+1;
  ellipse(b,160,40,40);
  ellipse(g,160,40,40);
  strokeWeight(10);
  point(b,160);
  point(g,160);
  point(d,240);
  d=d+1;
  i=i+1;
  point(i,240);
  strokeWeight(1);
  fill(w);
  w=w-1;
  ellipse(e,480,60,80);
  e=e+1;
  ellipse(j,480,60,80);
  j=j+1;
  }
