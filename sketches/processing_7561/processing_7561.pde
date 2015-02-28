
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117
//
// Hermann grid illusion
// 

void setup()
{
  size(255, 255);
  smooth();
  fill(64);
  noStroke();
}

void draw()
{
  background(196);
  int stepSize = 1 + mouseX;
  for (int x = 0; x < 255; x = x + stepSize)
  {
    for (int y = 0; y < 255; y = y + stepSize )
    {
      float boxsize = stepSize*(mouseY/float(height));
      rect(x, y, boxsize, boxsize);
    }
  }
}

