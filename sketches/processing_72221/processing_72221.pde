
//montana cruz, CP1
//
int x =0;
int z = 500;
int BIGGER = 1;
int y = 5;

void setup ()
{
  size (500,500);
}
void draw()
{
smooth();
fill (z,y,x);
frameRate (300);


fill (0,0,x);
ellipse (x,250,5,150);
ellipse (z,250,5,150);

fill (0,0,x);
stroke(255,0,0);
strokeWeight(1);
ellipse (250,250,x,x);

 
x = x + BIGGER;
z = z - BIGGER;
y = y + 5;

if (x>500)
{
  BIGGER = -1;
}
if (x<1)
{
  BIGGER = 1;
}
if (z<15)
{
  BIGGER = -1;
}
if (z>500)
{
  BIGGER = 1;
}
}
