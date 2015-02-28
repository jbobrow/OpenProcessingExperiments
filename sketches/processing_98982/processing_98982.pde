
void setup()
{
  size(500, 600);
  background(200, 200, 200);
  smooth();
  frameRate(60);
}

void draw()
{
  fill(random(100), random(100), random(100) );
}

void mouseDragged()
{
  ellipse(mouseX, mouseY, 80, 80);
}
