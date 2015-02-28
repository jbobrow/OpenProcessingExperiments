
// Keith O'Hara <kohara@bard.edu>
// Feb 3 2010
// CMSC 117
float r;

void setup()
{
  size(400, 400);
  smooth(); 
  strokeWeight(3);
  background(196);
  stroke(64);
  fill(64);
}

void draw()
{  

  if (keyPressed)
  {
    background(196);
  }

  if (mousePressed)
  {
    r = random(0, 30);
    ellipse(mouseX, mouseY, r, r);
    ellipse(width-mouseX, mouseY, r, r);
  }
}



