
void setup ()
{
  size (500, 500);
}

void draw ()
{
  colorMode (HSB, 500);
  background (mouseX, mouseY/10, 500);
  strokeWeight (mouseY/(mouseX+1));
  line (250, mouseX, 250, mouseY);
  line (mouseX, 250, mouseY, 250);
  line (250, 250, mouseY, mouseX);
  line (mouseX, mouseY, 250, 250);
}
void mousePressed ()
{
  if (mousePressed && (mouseButton == LEFT))
  {
    saveFrame ("minimalist_####.jpg");
      }
}

