
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (25);

  background (#57385c);
}

void draw ()
{
  background (#57385c);
  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (mouseX, mouseY, 50, 50);
}

