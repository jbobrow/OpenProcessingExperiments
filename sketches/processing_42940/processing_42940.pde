
PImage car, background1;
int carCenterX = -200;
int carCenterY = 60;
float velocityX = 2;
float velocityY = 1;


void setup()
{
size(548, 548);
car = loadImage("car.png");
background1 = loadImage("background1.png");
rectMode(CENTER);
}

void draw()
{
  image(background1, 0, 0);
  carCenterX += velocityX;
  carCenterY += velocityY;
  image(car, carCenterX, carCenterY);
  
  if(carCenterX == width)
  {
  carCenterX = -200;
  carCenterY = 60;
  }
}

