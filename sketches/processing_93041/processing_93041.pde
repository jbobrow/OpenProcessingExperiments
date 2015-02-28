
float positionX=200;
float positionY=200;
float speed=10;
float direction= 25;

void setup ()
{
  size(500, 500);
}

void draw()
{
  background(210);
  float moveX = speed * cos(radians(direction));
  float moveY = speed * sin(radians(direction));

  positionX = positionX + moveX;
  positionY += moveY;

  if (positionX>width)
  {
    positionX=width;
    direction=180-direction;
  }
  if (positionY>height)
  {
    positionY=height;
    direction=360-direction;
  }

  if (positionX<0)
  {
    positionX=0;
    direction=270-direction;
  }
  
  if (positionY<0)
  {
    positionY=0;
    direction=90-direction;
  }
  ellipse(positionX, positionY, 50, 50);
}



