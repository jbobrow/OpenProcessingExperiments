
PImage bgImage;
PImage car;

void setup()
{
  size(548, 548);
  bgImage = loadImage("background.png");
  car = loadImage("car.png");
}

int i = 0;
int xPos = -130;
int yPos = 100;

void draw()
{
  image(bgImage, 0, 0);
    
    //xPos = xPos + 2*i;
    //yPos = yPos + i;
    image(car, xPos + 2*i, yPos + i);
    i++;

    if(xPos + 2*i > 550)
    {
      i = 0;
    }
}

