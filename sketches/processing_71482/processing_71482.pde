
int x = 10;
int y = 10;
void setup()
{
  size(800, 600);
}
void draw()
{
  background(197);
  ball();
}
void ball()
{
  ellipse(mouseX, mouseY, x, y);
  if (mousePressed==true && mouseButton==LEFT)
  {
    x=x+1;
    y=y+1;
  }
}
