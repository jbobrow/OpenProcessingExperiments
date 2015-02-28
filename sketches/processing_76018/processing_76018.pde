
//Montana C, CP1 4/5
PImage a;
PImage b;
int x = 1;
int y = 1;

void setup()
{
  size(700, 700);
  frameRate(1);
  a = loadImage("http://images5.fanpop.com/image/photos/29400000/White-writing-29491444-516-350.jpg");
  b = loadImage("http://1.bp.blogspot.com/_B1LlYh6iKqs/TA9IsxacFSI/AAAAAAAABo4/6vE72KAD2DI/s1600/snoop-dogg.jpg");
}
void draw()
{
  image(a, 0, 0, 700, 700);
  while (x < y)
  {
    image(b, random(0, 650), random(0, 650), 50, 70);
    x++;
  }
  if ( x >= y)
  {
    y = y * 2;
  }
  if ( x > 4000)
  {
    x = 1;
    y = 1;
  }
  fill(0, 0, 0);
  text(x/2, 50, 50);
}




