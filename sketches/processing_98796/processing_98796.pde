
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{ 

  fill( random(255), random(255), random(255) );
  
  ellipse(width/2, height/2, width-frameCount*5, width-frameCount*5);
  
  if (frameCount*5 > width)
  {
    noLoop();
  }
  
}
