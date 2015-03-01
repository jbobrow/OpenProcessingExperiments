
void setup()
{
  // window size
  size(480, 120);
  // anti-aliasing
  smooth();
}

void draw()
{
  // when mouse pressed or not
  if (mousePressed)
  {
    // color is 0
    fill(0);
  }
  else
  {
    // color is 255
    fill(255);
  }
  
  // draw ellipse
  ellipse(mouseX, mouseY, 80, 80);
}


