
int x, y, l, h;

void setup()
{
  x = 0;
  y = 0;
  l = 10;
  h = 5;
}

void draw()
{
  rect(x, y, x + l, y + h);
  
  // When a key is pressed, change the positions
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == DOWN) {
        y++;
      }
    }
  }
}

