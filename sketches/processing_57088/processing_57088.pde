

void setup()
{
  size(500, 500);
  smooth();
  background(255);
}

void draw()
{
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 20, 20);
}

