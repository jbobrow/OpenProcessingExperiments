
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
  if(posX>400)
  {
    posX = 0;
  } 
  if(posY>400)
  {
    posY = 0;
  }
}

  



