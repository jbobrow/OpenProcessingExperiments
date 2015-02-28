
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(2);
}

void draw()
{ 

  if (frameCount%2 == 0)
  {
    fill(255, 0, 0);
  }
  
  if (frameCount%2 == 1)
  {
    fill(0, 255, 0);
  }
  
  
  ellipse(width/2, height/2, 200, 200);
  
 
}
