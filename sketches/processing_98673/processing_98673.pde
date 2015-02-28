
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(random(255), random(255), random(255) );
}

void mouseDragged()
{
  ellipse(mouseX, mouseY, 30, 30);
}

void keyPressed()
{
  if (key == ' ')
  {
    background(255, 255, 255);
  }
}

