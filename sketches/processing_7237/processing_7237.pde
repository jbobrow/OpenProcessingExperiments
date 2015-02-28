

// Keith O'Hara
// <kohara@bard.edu>
// CMSC 117 - Jan 27 2010

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  strokeWeight(5);
}

void draw()
{
  background(0);
  strokeWeight(mouseX/10);
  line(0, 0, mouseX, mouseY);
}

