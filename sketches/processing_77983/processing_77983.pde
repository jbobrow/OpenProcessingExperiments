
int x, y;
 
void setup ()
{
  size (900, 700);
  background (110,100);
  x=0;
  y=0;
}
 
void draw ()
{
  if (keyPressed)
  {
    if (key == ' ' || key == ' ')
    {
      background(0);
    }
  }
 
  noStroke();
  fill (random(200), random(200), random(200));
  rect (mouseX, mouseY, random(70), random(70));
}


