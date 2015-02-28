
void setup()
{
  size(500, 500); 
  background(255); 
  smooth();
}

void draw() 
{
  
    for (int posX = 25; posX<width; posX = posX+50)
  {

    for (int posY = 25; posY<height; posY = posY+50)
    {
      
// Création d'un cercle 
noStroke();
fill(#1F5FCB,90);
ellipse(posX, posY, 50, 50);

// Création d'un deuxième cercle, deux fois plus gros que le premier
noStroke();
fill(#2C5393,30);
scale(2.0); 
ellipse(posX, posY, 50, 50);

// Création d'un troisième cercle, 0,5 fois plus gros que le deuxième
noStroke();
fill(#11284D,40);
scale(0.5); 
ellipse(posX, posY, 50, 50);
    }
  }
  noLoop();
}



