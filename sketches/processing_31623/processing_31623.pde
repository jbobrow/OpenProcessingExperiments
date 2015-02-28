
int x = 140;
int y = 195;
int z = 250;
int v = 305;

void setup ()
{
  size (500, 500);
  noFill ();
  background (255);
  //fill (255, 0, 0, 10);
}

void draw ()
{
  ellipse (z, z, x, x);
  ellipse (z, x, x, x);
  ellipse (y, x, x, x);
  ellipse (v, x, x, x);
  ellipse (365, x, x, x);
  ellipse (x, x, x, x);
  ellipse (z, y, x, x);
  ellipse (z, 305, x, x); 
  ellipse (z, 365, x, x);
  ellipse (y, z, x, x);
  ellipse (v, z, x, x);
  ellipse (365, z, x, x);
  ellipse (v, y, x, x);
  ellipse (365, y, x, x);
  ellipse (x, y, x, x);
  ellipse (v, v, x, x);
  ellipse (365, v, x, x);
  ellipse (x, v, x, x);
  ellipse (y, v, x, x);
  ellipse (y, y, x, x);
  ellipse (y, 365, x, x);
  ellipse (365, 365, x, x);
  ellipse (v, 365, x, x);
  ellipse (x, 365, x, x);
  ellipse (x, z, x, x);
}

