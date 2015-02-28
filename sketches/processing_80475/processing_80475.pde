
void setup()
{
  size(500,500);
  background(250);  
}


void draw ()
{
  //Width sert à répéter une ligne horizontalement
 for (int posX = 35; posX < width; posX = posX+50)
{
  //Height sert à répéter une ligne verticalement
  for (int posY = 15; posY < height; posY = posY+50)
  {
    ellipse(posX, posY, 70, 70);
    rect(posX, posY, 70, 70);
  }
  
}
  
 noLoop(); 
}


