
int a = 250; 
int b = 300;
int c = 200;
int d = 250;
int e = 300;
int f = 200;
int g = 250;
int h = 320;
int i = 180;
int j = 340;
int k = 160;
int l = 230;
int m = 270;
int n = 250;
int o = 230;
void setup()
{
  size(500,500);
  background(#67CE1F);
}
void draw()
{
  background(#67CE1F);
  frameRate(5);
  fill(#AA5B11);
  ellipse(a,350,180,180);
  a=a+20;
  ellipse(b,220,60,60);
  b=b+20;
  ellipse(c,220,60,60);
  c=c+20;
  noStroke();
  fill(#DB9B5F);
  ellipse(d,380,120,120);
  d=d+20;
  ellipse(e,220,30,30);
  e=e+20;
  ellipse(f,220,30,30);
  f=f+20;
  fill(#AA5B11);
  ellipse(g,260,120,120);
  g=g+20;
  ellipse(h,420,80,80);
  h=h+20;
  ellipse(i,420,80,80);
  i=i+20;
  ellipse(j,340,60,60);
  j=j+20;
  ellipse(k,340,60,60);
  k=k+20;
  fill(#743B06);
  ellipse(l,235,30,30);
  l=l+20;
  ellipse(m,235,30,30);
  m=m+20;
  ellipse(n,260,20,20);
  n=n+20;
  rect(o,285,40,5);
  o=o+20;
}
