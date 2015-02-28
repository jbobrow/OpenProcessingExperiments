
void setup()
{
  size(500, 500);
  smooth();
  
}
void draw()
{
  fill(255, 0, 0, 10);
  strokeWeight(0.1);
  
  if (mouseButton == LEFT)
  
  fill(255, 100, 0, 8);
  
  if (mouseButton == RIGHT)
  
  fill(255, 230, 0, 8);
  
  rect(mouseX,mouseY, 50, 50);
  rect(mouseX,mouseY, 25, 25);
  
}

