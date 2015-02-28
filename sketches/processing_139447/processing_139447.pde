
/* @pjs preload="spaceworld.jpg, burger.png, bobross.gif"; */

PImage boom;
PImage bobross;
PImage burger;
boolean isblue = false;
float dasnumber = 0;
float nextX;
float nextY;

void setup()
{
  size(500,500);
  frameRate(30);
  boom = requestImage("spaceworld.jpg");
  burger = requestImage("burger.png");
  bobross = requestImage("bobross.gif");
}

void draw()
{
  image(boom,0,0,width,height);
  filter(INVERT);
  
  for( int yoffset = 0; yoffset < height; yoffset += 10)
  {
    stroke(#CD3333);
    line(0, yoffset, width, yoffset);
  }
  
  for( int xoffset = 0; xoffset < width; xoffset += 30)
  {
    stroke(#3333CD);
    line(xoffset, 0, xoffset, height);
  }

  image(bobross,100,250,50,50);
  image(burger,400,250,50,50);

  float ly=260.0;
  float lx=110.0;
  float endx=400.0;
  float endy=260.0;
  
  while (lx < 400)
  {
    float nextX = lx + random(10);
    float nextY = ly+ random(10);
    line(lx,ly,nextX,nextY);
    ly= nextY;
    lx= nextX;
  }
}



