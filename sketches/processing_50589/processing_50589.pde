
float a, b, c;
void setup ()
{
  smooth();
  noStroke();
  size(400,400);
  a = random (0, 400);
  b = random (0, 400);
  c = random (225);
  background (100 + 125 * cos(PI + a), 100 + 125 * cos(PI + b), 100 + 125 * cos(PI + c) );
}

void draw ()
{
  fill(100 + 125 * cos(a), 100 + 125 * cos(b), 100 + 125 * cos(c) );
  ellipse(a,b,13 + 4 * cos(c), 13 + 4 * cos(c));
  
}
void keyPressed()
{
  c = c + 1;
  if (key == ' ')
  {
    a = random (0, 400);
    b = random (0, 400);
    c = random (225);
    background (100 + 125 * cos(PI + a), 100 + 125 * cos(PI + b), 100 + 125 * cos(PI + c) );
  }
  
  if ( keyCode == UP)
  {
    a = a;
    b = b - 20;
  }
  
   if ( keyCode == DOWN)
  {
    b = b + 20;
  }
  
  if (keyCode == LEFT)
  {
    a = a - 20;
  }
  
  if ( keyCode == RIGHT)
  {
    a = a + 20;
  }
 
}
