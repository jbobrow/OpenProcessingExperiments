
//je crée mon sketch
void setup ()
{
  size (500,500);
  background(255);
  smooth();
  noFill();
}

//je crée ma fontion draw
void draw ()
{
  //je crée une boucle for
for (int posX=20; posX<width; posX= posX+50)
{
  for (int posY=20; posY<height; posY= posY+50)
  {
  //je crée des cerlces avec ces boucles for
  stroke(#05FF2C);
  ellipse(posX,posY,random(60),60);
  //je crée des cercles avec ces boucles for
  stroke(#05F5FF);
  ellipse(posX,posY,40,random(40));
  //je crée d'autres ellipses en décalages
  stroke(#FF05FC);
  ellipse(posX+20,posY+20,random(40),random(40));
  //je crée d'autres ellipses en décalages
  stroke(#FFF305);
  ellipse(posX+20,posY+20,random(65),65);
  }
  
  //je fais un rectangle par dessus
 
}
  
  
  
}

