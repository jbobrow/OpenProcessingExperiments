
void setup()
{
  background(0);
  strokeWeight(4);
  smooth();
  size(500,500);
}

void draw()
{
  stroke(mouseX/4, 280, 400);
  ellipse(mouseX, mouseY, mouseX, mouseY);
}

