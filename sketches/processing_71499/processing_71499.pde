
// Justin L., RedShapes User Input CP1 Mods 16/17

void setup()
{
  size(500, 500);
  background(34, 35, 34);
}
void draw()
{
}
void keyPressed()
{
  if (keyPressed == true && key == 'w')
  {
    ellipse(mouseX, mouseY, 20, 20);
    ellipse(500-mouseX, 500-mouseY, 20, 20);
  }
}
void mouseDragged()
{
  background(34, 35, 34);
  fill(255, 40, 60);
  triangle(mouseX, mouseY, mouseX-50, mouseY-50, mouseX+50, mouseY-50);
}
