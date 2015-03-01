
int a=0;
int b=100;
int c=170;
int d=600;
int e=560;
int f=680;
int g=720;
int h=820;
int i=960;
int j=660;
float r;
float y;
float v;

void setup()
{
  size(600,600);
}
void draw()
{
  frameCount=1;
  background( #06ACF1);
  noStroke();
  fill(255);
  ellipse(a,200,90,90);
  a=a+1;  
  ellipse(b,220,120,120);
  b=b+1;
  ellipse(c,240,40,40);
  c=c+1;
  
  r=random(0,250);
y=random(40,100);
v=random(60,210);
strokeWeight(5);
stroke(0);
  fill(r,y,v);
  line(100,f,105,h);
  f=f-1;
  h=h-1;
  line(300,j,305,i);
  i=i-1;
  j=j-1;
  line(500,f,505,h);
  triangle(100,f,80,g,120,g);
  g=g-1;
  triangle(300,j,280,g,320,g);
  triangle(500,f,480,g,520,g);
  ellipse(100,d,200,200);
  d=d-1;
  e=e-1;
  ellipse(300,e,240,240);
  ellipse(500,d,200,200);
  fill( #F30F1F);
  noStroke();
  ellipse(mouseX,mouseY,40,40);
}
