
// Keith O'Hara <kohara@bard.edu>
// Feb 10 2010
// CMSC 117
//
// Nesting Loops
// 

void setup()
{
  size(300, 300);
  smooth();
}

void draw()
{
  background(196);
  
  noFill();
  for (int x = 0; x < mouseX; x = x + 10)
  {
    for (int y = 0; y < mouseY; y = y + 10)
    {
      rect(x, y, 10, 10);
    }
  }
  
  stroke(255, 255, 255);
  fill(255, 0, 0, 128);
  for (int x = 0; x < mouseX; x = x + 10)
  {
    rect(x, x, 10, 10);
  }
  for (int y = 0; y < mouseY; y = y + 10)
  {
    rect(y, y, 10, 10);
  }
}

