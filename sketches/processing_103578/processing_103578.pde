
void setup()
{
  size(600, 600);
  background(80, 80, 150);
}

void draw()
{
  fill(80, 80, 150, 5);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  if(mousePressed)
  {
    fill(255, 150, 200, 50);
    stroke(255, 150, 200, 50);
  }
  else
  {
    fill(250, 100, 255, 50);
    stroke(250, 100, 255);
  }
  int radius = random(10, 100);
  ellipse(mouseX, mouseY, radius, radius);
}
