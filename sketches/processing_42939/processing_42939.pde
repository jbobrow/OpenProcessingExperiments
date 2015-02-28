
PImage back, car;

float carX = -130;
float carY = 100;
float vX= 3;


void setup ()
{
  size (548, 548);
  back = loadImage ("back.png");
  car = loadImage ("car.png");
}

void draw ()
{
  background (255);
  image (back, 0, 0);
  
  
  carX = carX+ vX*2;
  carY = carY +vX*1;
  
  if (carX > width)
  {

    vX= -10;
    carX = -130;
    carY = 100;
  
  }
  
  if (carX < width)
  {
      vX=2;
  }

  
  image (car,  carX , carY);

  
}

