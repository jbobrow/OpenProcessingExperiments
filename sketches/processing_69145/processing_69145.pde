
//Jarvis Law,Repeating Loops,CP1 Mod 19-20

size(500,500);
background(5,36,55);
smooth();
stroke(154,255,5);
fill(255,196,5);
int y=20;
while(y<201)
{
  int x=20;
  while(x<201)
  {
    ellipse(x,250,12,90);
    x=x+20;
  }
  ellipse(250,y,90,12);
  y=y+20;
}
int a=480;
while(a>299)
{
  int z=480;
  while(z>299)
  {
    ellipse(z,250,12,90);
    z=z-20;
  }
  ellipse(250,a,90,12);
  a=a-20;
}
fill(136,241,250,20);
stroke(11,95,157);
int b=20;
while(b<510)
{
  ellipse(250,250,b,b);
  b=b+20;
}
noFill();
stroke(167,5,255,80);
int c=10;
int d=0;
while(d<200)
{
  ellipse(250-d,250,20,c);
  ellipse(250+d,250,20,c);
  c=c+7;
  d=d+5;
}
