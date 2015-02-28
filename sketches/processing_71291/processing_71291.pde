
//William T, User Input, CP1 Mods 14-15

void setup()
{
  size(500, 500);
  background(0);
}
void draw()
{
  restart();
  randomizer(); 
  symmetric();

}
void randomizer()
{
  noStroke();
  if (keyPressed == true && key == 'r')
  { 
    fill(random(256), random(256), random(256));
    ellipse(mouseX, mouseY, 30, 30);
  }
  else
  {
    fill(mouseX, mouseY, 255-mouseX);
    ellipse(mouseX, mouseY, 30, 30);
  }
}
void symmetric()
{
  if (mousePressed == true)
  {
    ellipse(mouseX, mouseY, 30, 30);
    ellipse(500-mouseX, 500-mouseY, 30, 30);
  }
}
void restart()
{
  if (keyPressed == true && key == ' ')
  {
    background(0);
  }
}
