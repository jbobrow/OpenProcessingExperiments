

PImage car;
PImage bg;
int x = -130;
int y = 100;
void setup()
{
  size(500,500);
  car = loadImage("car.png");
  bg = loadImage("background.png");
}

void draw() 
{
  image(bg, 0, 0);
  
  if(x<550 && y<550)
  {
    x+=2;
    y+=1;
  }
  
  else
  {
    x=-130;
    y=100;
  }
  
  image(car,x,y); 
}

