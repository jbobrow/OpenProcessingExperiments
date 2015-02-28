
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
      ellipse(posX, posY, 40, 40);
      fill(255,50);
      ellipse(posX,posY,30,30);
      fill(60,30);
      ellipse(posX-25,posY-25,100,100);}
  }
  noLoop();
}


