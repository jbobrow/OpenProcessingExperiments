
int x = 10;
int t = 20;
int y = 250;

void setup ()
{
  size (500,500);
  noFill ();
  background (255);
  
  fill (255, 0, 0, 10);
}

void draw ()
{
 while ( x < 300)
{
 //ellipse (20,250, x, x);
 ellipse ( t, y, x, x);
 ellipse ( t, 50, x, x);
 ellipse (t, 450, x, x);
 x = x + 50;
}
t = t + 60;
x = 10;
if (0 >500){
  
  y = y + 100;
  

}
}


