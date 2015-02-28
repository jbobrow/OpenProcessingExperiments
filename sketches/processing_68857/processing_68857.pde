
//Lawrence J, Block 6, CP1, Loops 

size(800,600);
smooth();
noFill();
background(0);
strokeWeight(10);
stroke(170,0,255);
int x = 0;//30;
while (x<600)
{
  ellipse (400,300,x,x);
  x = x + 100;
}
int y = 11;//;
stroke(111,0,255);
while (y<600)
{
  ellipse (400,300,y,y);
  y = y + 100;
}
int z = 22;//20;
stroke(0,0,255);
while (z<575)
{
  ellipse (400,300,z,z);
  z = z + 100;
}
int a = 33;//;
stroke(0,255,0);
while (a<575)
{
  ellipse (400,300,a,a);
  a = a + 100;
}
int b = 44;//20;
stroke(255,255,0);
while (b<600)
{
  ellipse (400,300,b,b);
  b = b + 100;
}
int c = 55;
stroke (255,170,0);
while (c<600)
{
  ellipse (400,300,c,c);
  c = c + 100;
}
int d = 66;//0;
stroke(255,0,0);
while (d<600)
{
  ellipse (400,300,d,d);
  d = d + 100;
}
stroke(0);
fill(0);
rect(0,300,800,600);
