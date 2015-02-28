
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
  background(255, 255, 255);

  noStroke();
  fill( 255, 0, 0, frameCount);

  ellipse(width/2, height/2, 100, 100);

  if (frameCount > 255)
  {
    noLoop();
  }
  
}
