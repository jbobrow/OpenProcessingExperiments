
float posX = 100;
float posY = 200;

float pPosX = 100;
float pPosY = 200;

float speedX = 5.2;
float speedY = 5.6;


void setup()
{
  size(400, 400);
}



void draw()
{
  background(255);


  strokeWeight(5);
  line (pPosX, pPosY, posX+=speedX, posY+=speedY);
  pPosX = posX;
  pPosY = posY;

  if ((posX > width-5) || (posX < 5))
  {
    speedX = -speedX;
  }

  if ((posY > height-5) || (posY < 5))
  {
    speedY = -speedY;
  }
}








