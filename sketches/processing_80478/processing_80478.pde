
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
    //Pas de remplissage
    noFill();
    ellipse(posX, posY, 140, 140);
    ellipse(posX, posY, 70, 70);
    ellipse(posX, posY, 60, 60);
    ellipse(posX, posY, 50, 50);
    ellipse(posX, posY, 40, 40);
    ellipse(posX, posY, 30, 30);
  }
  
}
  
 noLoop(); 
}


