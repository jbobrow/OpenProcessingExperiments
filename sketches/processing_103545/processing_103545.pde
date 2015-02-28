
//GSwP 2.2 Make Circles

/*Original
void setup()
{
  size(480, 120);
  smooth();
}

void draw()
{
  if(mousePressed)
  {
    fill(0);
  }
  else
  {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
*/

void setup()
{
  size(600, 600);
  background(255);
}

void draw()
{
  if(mousePressed)
  {
    stroke(0, 255, 150); //green/blue
    fill(100, 255, 150); //light green/blue
  }
  else
  {
    stroke(150, 0, 255); //purple
    fill(150, 100, 255); //light purple
  }
  ellipse(mouseX, mouseY, 100, 100);
}
