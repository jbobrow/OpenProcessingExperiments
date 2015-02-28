
// Keith O'Hara <kohara@bard.edu>
// Feb 22 2010 Lecture

void setup()
{
  size(400, 400); 
}

void draw()
{
  background(0);
  for (int y = 0; y < height; y++)
  {
    stroke(y % (mouseY/2 + 1));
    line(0, y, width, y);
  }
}

