
float thickness = 1;

void setup()
{
  size(300, 300);
}

void draw()
{
  // clear the screen
  background(128);
  
  // increase thickness by 1 every frame until 15, then reset.
  thickness = thickness + 1;
  if (thickness > 15)
  {
    thickness = 1;
  }
  
  // draw a circle with the stroke thickness
  strokeWeight(thickness);
  ellipse(width / 2, height / 2, 100, 100);
}
