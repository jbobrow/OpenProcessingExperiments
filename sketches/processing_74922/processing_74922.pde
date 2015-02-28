
//Gregory Taxerman, Doubling Shapes, CP1 16-17

int x;
int y;
int z = 2;

void setup ()
{
  size(300, 300); 
  background (0); 
  frameRate(1);
}

void draw ()
{
  background(int(random(256)),int(random(256)),int(random(256)));
  int w = 0;
  fill(int(random(256)),int(random(256)),int(random(256)));
  while (w < z)
  {
    x = int(random(1, 301));
    y = int(random(1, 301));
    
    ellipse(x, y, 10, 10);
    w++;
  } 
  z = z * 2;

  if ( z > 1024)
  {
    z = 2;
  }

  fill(255);
  textSize(32);
  text(w, 20, 30);
}
