
size(400,400);
background(0);
noFill();
smooth();

smooth();
int x = 0;
int r = 10;
int g = 255;
int b = 165;
while ( x < 400)
{
  stroke(r,g,b);
  ellipse(200,200,x,150);
  x = x + 20;
  r = r + 10;
  b = b - 10;
  g = g - 10;
}
