
void setup()
{
  size(300, 300); 
  background(255); 
  smooth();
}

void draw() 
{
  fill(247, 45, 106);

  for (int posX = 25; posX<width; posX = posX+50)
  {

    for (int posY = 25; posY<height; posY = posY+50)
    {
      ellipse(posX, posY, 50, 50);
      ellipse(posX,posY,30,30);
      line(posX,posY,posX+10,posY+10);
    }
  }
  noLoop();
}


