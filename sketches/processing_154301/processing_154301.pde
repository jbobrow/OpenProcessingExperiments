
PImage zack;
float picWidth = 100;
float picHeight = 100;

float posX = random(0, 400 - picWidth);
float posY = random(0, 400 - picHeight);

float xMovement = 5;
float yMovement = 2;


void setup()
{
  size(400, 400);
  zack = loadImage("impossibru.jpg");
}

void draw()
{
  background(0, 0, 0);
  image(zack, posX, posY, picWidth, picHeight);
  posX += xMovement;
  posY += yMovement;
  if(posX>300)
  {
    xMovement *= -1;
    posX = 300;
  } 
  if(posX<0)
  {
    xMovement *= -1;
    posX = 0;
  }
  if(posY>300)
  {
    yMovement*= -1;
    posY = 300;
  }
  if(posY<0)
  {
    yMovement *= -1;
    posY = 0;
  }
}

  



