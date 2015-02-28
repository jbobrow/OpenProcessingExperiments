
void setup()
{
size(300,300); 
background(255); 
smooth();
}

void draw() 
{
  noFill();
  
  for (int posX = 25; posX<width; posX = posX+50)
  {

  for (int posY = 25; posY<height; posY = posY+50)
  {
  ellipse(posX,posY,50,50);}
  }
  noLoop();
}



