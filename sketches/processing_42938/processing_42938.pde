
PImage bg, car;
float x, y;

void setup()
{ 
  size(548, 548);
  bg = loadImage("background.png");
  car = loadImage("car.png");
  frameRate(60);
  x = -130;
  y = 100;
}

void draw()
{ 
  image(bg, 0, 0);
  drawCar();
  moveCar();

  if (x > width+car.width)
  { 
    x = 0-130;
    y = 0+100;
  }
}

void drawCar()
{ 
  image(car, x, y);
}

void moveCar()
{
  x = x+2;
  y = y + 1;
}


