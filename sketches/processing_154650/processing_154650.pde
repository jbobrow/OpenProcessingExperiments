
//Juliana Hong julianah
//Copyright
float x;
float y;
float dx;
float dy;
float x2;
float y2;
float distance;
void setup()
{
  
  size(400, 400);
  x = 50;
  y = 75;
  dx = 5;
  dy = 5;
  
}

void draw()
{
  background(34, 8, 70);
  x = x + dx;
  if (x + 50 > height || x - 50 < 0)
  {
    dx = -dx;
  }


  y= y + dy;
  if (y + 50 >height || y - 50 < 0)
  {
    dy = -dy;
  }
  
  
  
  if (x2<width)
  {
    x2+=3;
  
  }
  else
  {
    x2= 0;
  }


  if (y2<height)
  {
    y2+=5;  
  }
  else
  {
    y2= 0;
  }

fill(255,255,255);
ellipse(x, y, 100, 100);
ellipse(x2, y2, 50, 50);
  
  
distance = dist(x, y, x2, y2); //distance between circles 1 and 2
if (distance < 75)
{
  fill(255,0,0);
  rect(0, 0, 400, 400);
}

  
}














