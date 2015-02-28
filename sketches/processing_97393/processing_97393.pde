


int contadorFiguras = 0;
int figura = 0;
int tamano = 20;
void setup()
{
  size(1024, 640);
  frameRate(4);
}

void draw()
{
  background(255, 255);
  int randomX;
  int randomY;
  int randomG, randomB, randomR;
  
  for(int i = 0; i<contadorFiguras; i++)
  {
    randomX = (int)random(1024);
    randomY = (int)random(640);
    randomG = (int)random(256);
    randomR = (int)random(256);
    randomB = (int)random(256);
    
    if(figura == 0)
    {
          rect(randomX, randomY, tamano, tamano);
    }
    
    if(figura == 1)
    {
      ellipse(randomX, randomY, tamano, tamano);
    }
    
    if(figura == 2)
    {
      triangle(randomX, randomY, randomX+tamano, randomY, randomX+tamano/2, randomY+tamano/2);
    }
    fill (randomR, randomG, randomB);
  }
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
      contadorFiguras++;
  }
  
  if(mouseButton == RIGHT)
  {
    figura = (int)random(3);
  }
}

void mouseDragged()
{
  tamano++;
  if(tamano >= 500)
  {
    tamano = 10;
  }
}


