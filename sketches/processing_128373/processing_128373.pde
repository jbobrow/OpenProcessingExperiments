
/* @pjs preload="luigi.jpg, mario.JPG, wario.gif"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(500, 500);
  
  myimage = requestImage("mario.JPG");
  myimage2 = loadImage("luigi.jpg");
  myimage2.filter(DILATE);
  myimage3 = loadImage("wario.gif");
  myimage3.filter(ERODE);
}

void draw()
{
  if (myimage.width > 0)
  {
    myimage.filter(GRAY);
    image(myimage, 0, 0, width, height);
  }
  
  image(myimage2, 375, height/2, 100, 100);
  image(myimage3, 75, height/2, 100, 100);
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(255, 0, 0);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 20)
  {
    stroke(255, 0, 0);
    line(0, y, width, y);
  }
  
  stroke(0);
  strokeWeight(10);
  float ly = height/2;
  float lx = 100;
  while (lx < 375)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(-5, 5);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
}


