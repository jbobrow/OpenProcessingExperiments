
void setup()
{
  size(400, 600);
  background(127);
  frameRate(10);
}

void draw()
{
  background(127);
  ellipse(mouseX/2, mouseY/4*3, mouseY/3, mouseY/3);
  ellipse(mouseX/2, mouseY/2, mouseY/4, mouseY/4);
  ellipse(mouseX/2, mouseY/3, mouseY/5, mouseY/5);
  ellipse(random(200), random(400), 50, 50);
  ellipse(random(width), random(height), 10, 10);
}
