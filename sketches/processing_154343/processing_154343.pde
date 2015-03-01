
//Juliana Hong julianah
//Copyright
float x;
float y;
PImage photo;
float dx;
float dy;
void setup()
{
  
  size(400, 400);
  photo = loadImage("sky.JPG");
  dx = 5;
  dy = 5;
  
}

void draw()
{
  background(34, 8, 70);
  x = x + dx;
  if (x + 150 > 400 || x<0)
  {
    dx = -dx;
  }


  y= y + dy;
  if (y + 100 >height || y<0)
  {
    dy = -dy;
  }
 

image(photo, x, y, 150, 100);
  fill(255,0,155);
  
}





