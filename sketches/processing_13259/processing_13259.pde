
void setup()
{
  size(400,400);
}

void draw()
{
 
  {
    float i = random(1, 400);
    line(i, mouseX, i, mouseY);
    line(mouseX, i, mouseY, i);
  }
}
