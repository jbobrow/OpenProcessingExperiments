
//using dist() in a nested for loop
//creates a halftone spotlight effect

void setup()
{
  size(400, 400);
  smooth();
  fill(0);
}

void draw()
{
  background(230);
  for (int i=0; i<=width; i+=50)
  {
    for (int j=0; j<=height; j+=50)
    {
      float diameter = dist(mouseX, mouseY, i, j) / 3.3;
      ellipse(i, j, diameter, diameter);
    }
  }
}



