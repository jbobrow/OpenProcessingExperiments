
void setup()
{
  size(500, 500); 
  background(255); 
  smooth();
}

void draw() 
{
  
    for (int posX = 10; posX<width; posX = posX+10)
  {

    for (int posY = 10; posY<height; posY = posY+10)
    {
        
// Création d'un carré 
noStroke();
fill(#1F5FCB,90);
rect(posX, posY, 50, 50);

// Création d'un rectangle dont la hauteur est 1,5 fois plus grande que le premier carré.
noStroke();
fill(#2C5393,30);
scale(1.5, 1.0); 
rect(posX, posY, 50, 50);

// Création d'un troisième rectangle dont la longueur est 1,5 fois plus grande que le premier carré.
noStroke();
fill(#11284D,40);
scale(1.0, 1.5); 
rect(posX, posY, 50, 50);
    }
  }
  noLoop();
}


