
void setup()
{
  size(500, 500);
  smooth();
  stroke(0, 255, 230);
  noFill();
}
void draw()
{
    background(0, 0, 0);
  float xx;
  float yy;
  for (xx = 0; xx<=width; xx=xx+25)
  {
    line(mouseX, mouseY, xx, 0);
    line(mouseX, mouseY, xx, height);
  }
}
