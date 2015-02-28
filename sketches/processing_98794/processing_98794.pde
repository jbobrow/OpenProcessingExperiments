
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{ 
  background(255, 255, 255);
  
  fill(255, 0, 0);
  
  ellipse(width/2, height/2, frameCount, frameCount);
  
  if (frameCount > width)
  {
    noLoop();
  }
  
}
