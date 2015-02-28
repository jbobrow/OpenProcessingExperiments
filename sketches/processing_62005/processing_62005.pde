
void setup ()
{
  size (400, 600);
  background (181, 273, 239);
  smooth ();
  strokeWeight (3);
}

void draw ()
{
  fill (random (101), random (193), random (159), 90);
  rect (mouseX, mouseY, mouseX*2, mouseY*2);
}

void keyPressed()
{
  if (key==' ')
  {
    background (181, 273, 239);
  }
}
