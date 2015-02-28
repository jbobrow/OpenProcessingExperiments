
void setup()
{
  size(400, 600);
  background(0, 200, 255);
  smooth();
  stroke(0, 0, 0);
  
}

void draw()
{
  strokeWeight(random(5));
  line(0, 0, mouseX, mouseY);
  if (keyPressed)
  {
    line(400, 0, mouseX, mouseY);
  }
  if (mouseButton==RIGHT)
  {
    stroke(255, 255, 255);
  }
  if (mouseButton==LEFT)
  {
    stroke(0, 0, 0, 70);
  }
  save("blue.png");
}
