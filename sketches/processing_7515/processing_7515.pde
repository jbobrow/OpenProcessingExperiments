
// Keith O'Hara <kohara@bard.edu>
// Feb 8 2010
// CMSC 117

int x;
int y;

void setup()
{  
  size(255, 255); 
  fill(64);
  stroke(64);
  strokeWeight(5);
  background(196);
  x = width/2;
  y = height/2;
}

void draw()
{
    if (keyCode == UP)
    {
      y = y - 1;
    }
    if (keyCode == DOWN)
    {
      y = y + 1;
    }
    if (keyCode == LEFT)
    {
      x = x - 1;
    }
    if (keyCode == RIGHT)
    {
      x = x + 1;
    }
    point(x, y);
}


