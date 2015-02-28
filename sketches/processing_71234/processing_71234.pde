
//Aaron L., Animation, CP1, Mods 4-5

void setup()
{
  size (500, 500);
}
void draw()
{
  stroke(250, 0, 0);
  fill(250);
}
void mouseDragged()
{
  if (mouseButton==LEFT)
  {
  ellipse (mouseX, mouseY, 50, 50);
  ellipse (500-mouseX, 500-mouseY, 50, 50);
  }
  if (mouseButton==RIGHT)
  {
    stroke(0,0,255);
    fill (250);
    rect(mouseX,mouseY,mouseX,mouseY);
    rect(mouseY,mouseX,mouseY,mouseX);
  }
}
