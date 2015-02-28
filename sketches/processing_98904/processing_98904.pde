
float row;
float column;

void setup()
{
  size(400, 400);
  background(255, 255, 255);
  smooth();
  
}

void draw()
{
  stroke( random(255), random(255), random(255) );

  line(0, frameCount, frameCount, frameCount);
  line(frameCount, 0, frameCount, frameCount);
  
  println(frameCount);
  
  if (frameCount > width)
  {
    noLoop();
  }
  
}
