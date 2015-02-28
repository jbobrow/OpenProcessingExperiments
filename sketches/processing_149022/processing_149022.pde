

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  stroke(255, 255, 255);
  
  if (mousePressed)
  {  
    line( random(width), random(height), mouseX, mouseY);
  }

  
}



