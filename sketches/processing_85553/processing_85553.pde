
void setup()
{
size(300,300); 
background(255); 
smooth();
}

void draw() 
{
  noFill();
  
  for (int posX = 10; posX<width; posX = posX+10)
  {ellipse(posX,25,5,10);}

  for (int posY = 10; posY<width; posY = posY+10)
  {ellipse(110,posY,10,5);}
  
  noLoop();
  
}


