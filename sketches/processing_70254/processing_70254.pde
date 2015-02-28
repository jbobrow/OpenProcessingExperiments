
int x =0;
int z = 300;
int change = 1;
int y = 5;
int a = 0;
int b = 0;
int c = 0;
void setup ()
{
  size (300,300);
}
void draw() 
{
background(0); 
smooth();
fill (z,y,x);
frameRate (200);
ellipse (x,40,-20+x,30);
ellipse (x,100,-20+x,30);
ellipse (x,160,-20+x,30);
ellipse (x,220,-20+x,30);
ellipse (x,280,-20+x,30);
ellipse (z,250,-20+x,30);
ellipse (z,190,-20+x,30);
ellipse (z,130,-20+x,30);
ellipse (z,70,-20+x,30);
ellipse (z,10,-20+x,30);
fill (x,b,z);
ellipse (x,x,5,150);
ellipse (z,z,5,150);
ellipse (z,x,5,150);
ellipse (x,z,5,150);
noFill();
stroke(a,x,c);
strokeWeight(1);
ellipse (150,150,x,x); 
ellipse (150,150,z,z);
ellipse (150,100,x,x);
ellipse (150,200,x,x);
ellipse (200,150,z,z);
ellipse (100,150,z,z);

x = x + change;
z = z - change;
y = y + 5;
a = a + 15;
b = b + 30;
c = c + 60;
if (x>285)
{
  change = -1;
}
if (x<15)
{
  change = 1;
}
if (z<15)
{
  change = -1;
}
if (z>285)
{
  change = 1;
}
}





