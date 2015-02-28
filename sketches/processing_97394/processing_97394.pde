



int randomNumber = 0;
int randomX = 0;
int randomY = 0;
int randomR, randomG, randomB = 0;
int randomFigure;

void setup()
{
  size(1024, 640);
  frameRate(60);
}

void draw()
{
  background(255, 255, 255); 
  for (int i=0; i<randomNumber; i++)
  {
    randomX = (int)random(1024);
    randomY = (int)random(640);
    randomR = (int)random(255);
    randomG = (int)random(255);
    randomB = (int)random(255);
    if(randomFigure == 0)
    {
          rect(randomX, randomY, 20, 20);
    }
    
    if(randomFigure == 1)
    {
      ellipse(randomX, randomY, 20, 20);
    }
    
    if(randomFigure == 2)
    {
      triangle(randomX, randomY, randomX+20, randomY, randomX+10, randomY+20);
    }
    fill(randomR, randomG, randomB);
  }
}

void mousePressed()
{
    randomFigure = (int)random(3);
    randomNumber = (int)random(200);
}


