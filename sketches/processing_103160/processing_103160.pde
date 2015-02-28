
void setup()
{
  size(600, 600);
  background(255, 200, 225);
}

void draw()
{
  fill(0, 0, 255);
  strokeWeight(20);
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, 80, 80);
}
