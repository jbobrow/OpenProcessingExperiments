
PImage car;
PImage backgr;
int posX = -130;
int posY = 100;
int moveX = 2;
int moveY = 1;

void setup()
{
  size(500,500);
  car = loadImage("car.png");
  backgr = loadImage("background.png");
}

void draw()
{
  image(backgr, 0, 0);
  image(car, posX, posY);
  posX = posX + moveX;
  posY = posY + moveY;
  if(posX == 600)
  {
    posX = -130;
    posY = 100;
  }
}

