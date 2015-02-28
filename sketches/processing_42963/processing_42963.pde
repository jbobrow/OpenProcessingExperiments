
PImage img;
PImage car;

void setup()
{
  size(500, 500);
  img = loadImage("background.png");
  car = loadImage("car.png");
}


int posX = -130;
int posY = 100;

void draw()
{
  posX = posX + 2;
  posY = posY + 1;
  image(img, 0, 0);
  
  image(car, posX, posY);
  
  for(int i=0; i<width; i++)
  {
    image(car, -130, 100);
  }
  
  if(posX>width)
  {
    posX = -130;
    posY = 100;
  }
  
}
  

