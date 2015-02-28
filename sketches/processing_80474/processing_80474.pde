
void setup()
{
  size(500,500);
  background(250);  
}


void draw ()
{
  
 for (int posX = 25; posX < width; posX = posX+50)
{
  for (int posY = 0; posY < height; posY = posY+50)
  {
    ellipse(posX, posY, 50, 50);
  }
  
}
  
 noLoop(); 
}


