
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117

void setup()
{
  size(300, 300);
  smooth();
  noFill();
}

void draw()
{
  background(64);
  for (int i = 0; i < 255; i = i + 1)
  {
    stroke(i);
    ellipse(width/2, height/2, i, i);
  }
}

