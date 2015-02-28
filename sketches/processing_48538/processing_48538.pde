
void setup()
{
  size(600, 600);
  background (255, 255, 255);
  smooth();
  // frameRate(10);
}

void draw()
{
  fill (255, 255, 255, 20);
  rect(0, 0, 600, 600);
  // background (255, 255, 255);
  fill(0, 0, 255);
  ellipse( mouseX, mouseY, 50, 50);
}
void mousedragged()
{

  fill(random(255), random(255), random (255));
  ellipse (mouseX, mouseY, 0, 0);
}


