
void setup()
{
  size(500,500);
  background(0);
  smooth();
}

void draw()
{
  background(0);
  stroke(255);
      
  pushMatrix();
  scale(frameCount);
  ellipse(0,0,20,20);
  popMatrix();
  
  pushMatrix();
  scale(frameCount);
  fill(0);
  ellipse(0,0,20,20);
  popMatrix();
  
  if( frameCount > 100)
  {
     frameCount = 0;
  } 
}
