
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117

void setup()
{
  size(255, 130);
}

void draw()
{
  for (int r = 0; r < 255; r = r + 10)
  {
    stroke(r, mouseX, mouseY);
    fill(r, mouseX, mouseY);
    rect(r, 5, 5, 120);
  }
}


