
/* @pjs preload="lamp.jpg","adam west as batman.jpg","spuderman.jpg"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(500,500);
  myimage = requestImage("lamp.jpg");
  myimage2 = loadImage("spuderman.jpg");
  myimage3 = loadImage("adam west as batman.jpg");
}

void draw()
{
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
  }
  image(myimage2, 360, 300, 100, 100);
  image(myimage3, 40, 300, 100, 100);
  filter(POSTERIZE, 5);
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(0);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 10)
  {
    stroke(0);
    line(0, y, width, y);
  }
  stroke(0);
  strokeWeight(10);
  float ly = 350.0;
  float lx = 135.0;
  while (lx < width-150)
  {
    float nextX = lx + random(70);
    float nextY = ly + random(5);
    line( lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  
  lx = width/2;
  ly = height/2;
  for (int n = 0; n < 10; n += 1)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
  }
  strokeWeight(1);
}


