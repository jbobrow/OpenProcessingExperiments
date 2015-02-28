
void setup ()
{
  size (250,250);
  frameRate (50);
}
int x=0;
void draw ()
{
x=x+1;
if (x>250) {x=0;}
background (212,226,247);
stroke (10);
fill (229,198,79);
smooth ();
rect (x-30,10,60,20);
rect (x-20,30,80,20);
rect (x-10,50,100,30);
rect (x,80,110,40);
noFill ();
bezier (x-40,50,40,10,60,70,10,100);
bezier (x-40,40,40,10,60,70,10,100);
bezier (x-40,30,40,10,60,70,10,100);
bezier (x-40,20,40,10,60,70,10,100);
}
                
                
