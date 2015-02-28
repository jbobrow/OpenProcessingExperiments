
//shadow by Amy Zhen
// September 17, 2010
void setup()
{
  size(500, 500);
  background(82, 41, 149);
  smooth();
}

void draw()
{
  fill(225, 20);
  noStroke();
  ellipse(mouseX, mouseY, 55, 55);
  
  if(mousePressed)
  {
    background(82, 41, 149);
  }
}

