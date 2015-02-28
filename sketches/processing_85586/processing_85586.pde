
PImage car;
PImage bground;

int i = 0;
int X = -130;
int Y = 100;

void setup() 
{
  size(548, 548);
  car = loadImage("car.png");
  bground = loadImage("background.png");
}

void draw() 
{
  image(bground, 0, 0);
  image(car, X + 2*i, Y + i);
  i++;
  if(X + 2*i > 548)
  i = 0;
}
  

