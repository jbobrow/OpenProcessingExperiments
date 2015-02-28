
/* Keith O'Hara <kohara@bard.edu
   Feb 15 2010
   CMSC 117 Lecture
*/

void setup()
{
  size(400, 400);
  smooth();
}

void draw()
{
  background(96);
  stroke(128, 128);
  for (int y = 0; y < height; y = y + mouseX + 1)
  {
    line(0, y, width-1, y);
  }
  for (int x = 0; x < width; x = x + mouseX + 1)
  {
    line(x, 0, x, height-1);
  }
  if(mousePressed)
  {
    println(mouseX);
  }
}

