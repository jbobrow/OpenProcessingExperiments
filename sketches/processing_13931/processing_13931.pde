
//Made by Jackson, with source code borrowed from Sandychen, with thanks.

void setup()
{
  size(1000,800);
  smooth();
  background(80, 80, 200, 255);
}
void draw()
{
  fill(random(255), random(255));
  rect(mouseX, mouseY, random(70), random(70));

}





