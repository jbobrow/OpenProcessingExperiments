
void setup ()
{
  size (250,250);
  frameRate (100);
}
int x=0;
void draw ()
{
x=x+1;
if (x>250) {x=0;}
background (148,211,229);
noStroke ();
smooth ();
ellipse (x,50,70,70);
ellipse (x,175,120,120);
ellipse (x,120,95,95);
rect (x-20,01,40,40);
rect (x-30,10,60,10);
}
                
