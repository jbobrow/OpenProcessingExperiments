
//Gregory Taxerman, Random Walk, CP1 16-17


float x = 200;
float y = 200;
float z = 300;
float w = 300;
int r = 150;
int g = 150;
int b = 150;
void setup ()
{
  size(400,400);
  background (0);
  frameRate (10000);
}

void draw ()
{
  stroke(r,g,b);  
  point(x,y);
  point(z,w);
   
  x = x + (random(-2, 2));
  y = y + (random(-2, 2));
  w = w + (random(-2, 2));
  z = z + (random(-2, 2));
  r = r + int(random(-100,100));
  g = g + int(random(-100,100));
  b = b + int(random(-100,100));
 
  
  if( x > 400)
  {
    x = 200;
  }
  if( x < 0)
  {
    x = 200;
  }
  if( y > 400)
  {
    y = 200;
  }
  if( y < 0)
  {
    y = 200;
  }
  if( z > 400)
  {
    z = 300;
  }
  if( z < 0)
  {
    z = 300;
  }
  if( w > 400)
  {
    w = 300;
  }
  if( w < 0)
  {
    w = 300;
  }
  if(mousePressed == true)
  {
    background (0);
  }
}
