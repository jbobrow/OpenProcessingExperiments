
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);
}

void draw()
{ 

  if (frameCount%3 == 0)
  {
    fill(255, 0, 0);
  }
  
  if (frameCount%3 == 1)
  {
    fill(0, 255, 0);
  }
  
  if (frameCount%3 == 2)
  {
    fill(0, 0, 255);
  }
  
 
  ellipse(width/2, height/2, frameCount%width, frameCount%width);
  
  
}
