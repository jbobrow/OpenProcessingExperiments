
void setup()
{
  size(600, 400);
  background(200, 0, 100);
  textAlign(CENTER);
  textSize(12);
}
void draw()
{
  fill(255, 255, 255);
  textSize(mouseY/5);
  text("FIJI", mouseX, mouseY);
}


