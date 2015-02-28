
void setup()
{
  size(300, 300); 
  background(255); 
  smooth();
}

void draw() 
{

  for (int posX = 25; posX<width; posX = posX+50)
  {

    for (int posY = 25; posY<height; posY = posY+50)
    {
      ellipse(posX, posY, 50, 50);
      fill(225,posX);
      ellipse(posX,posY,30,30);
      line(posX,posY,posX+10,posY+10);
      ellipse(posX+25,posY+25,50,50);}
  }
  noLoop();
}


