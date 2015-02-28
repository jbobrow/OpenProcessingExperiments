
PImage car;
PImage bg;
int carX;
int carY;

void setup()
{
  size(548, 548);
  car = loadImage("car.png");
  bg = loadImage("background.png");
  carX = -130;
  carY = 100;
  imageMode(CENTER);
}

void draw()
{
  image(bg, width/2, height/2);
  image(car, carX, carY);
  carX += 2;
  carY += 1;
  
  if(carX > width + 62)
  {
    carX = -130;
    carY = 100;
  }
}

