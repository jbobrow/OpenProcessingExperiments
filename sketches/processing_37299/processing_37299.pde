
int x, y;

void setup ()
{
  size (900, 700);
  background (0);
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
  fill (random(255), random(255), random(255));
  ellipse (mouseX, mouseY, random(30), random(70));
}


