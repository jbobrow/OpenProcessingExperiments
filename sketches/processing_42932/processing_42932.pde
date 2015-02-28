
PImage car, street;
float x,y;

void setup()
{
    car = loadImage("car.png");
  street = loadImage("background.png");
  size(street.width,street.height);

  x=-130;
  y=100;
}

void draw()
{
    image(street,0,0);
  image(car,x,y);
  x+=2;
  y++;
  if(x>width+100)
  {
    x=-130;
    y=100;
  }
}

