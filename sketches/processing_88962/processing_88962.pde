
void setup()
{
  size (200, 200);
}

void draw()
{
  if (mouseX <= width/2)
  {
    background (255);
  }
  
  else
  {
    background (0);
  }
  
  fill (255, 255, 0);
  rect (80, 30, 40, 40);
  rect (80, 80, 40, 70);
  
  fill (0, 0, 255);
  ellipse (90, 40, 10, 10);
  ellipse (110, 40, 10, 10);
  triangle (100, 50, 110, 60, 90, 60);
  
  fill (255, 0, 0);
  ellipse (100, 100, 10, 10);
  ellipse (100, 130, 10, 10);
}
