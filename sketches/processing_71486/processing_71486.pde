
//User Imput, Aidan F., Computer Programing 1

void setup()
{
  size(800, 800);
  stroke(46, 164, 87);
  fill(244, 139, 96);
}
void draw()
{
  if (mouseX > 0)
  {

    triangle(mouseX, mouseY, mouseX + 40, mouseY + 40, 400, 400);
    triangle(800 - mouseX, 800 - mouseY, mouseX + 40, mouseY + 40, 400, 400);
  }
}
