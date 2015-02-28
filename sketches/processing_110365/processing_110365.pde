
float x = 0;
float speed = 10;
int erosionTimer = 0;
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup()
{
  size(400, 400);
  frameRate(30);
  myImage1 = requestImage("AssassinLogo.jpg");
  myImage2 = requestImage("EdwardKenway.png");
  myImage3 = requestImage("Connor.png");
}
void draw()
{
  if (myImage1.width > 0)
  {
    image(myImage1, 0, 0, width, height);
  }

  for (float xx = 0; xx < width; xx += 36.5)
  {
    stroke(0);
    line(xx, 0, xx, height);
  }

  for (float yy = 0; yy < height; yy += 36.5)
  {
    stroke(0);
    line(0, yy, width, yy);
  }

  noStroke();

  erosionTimer += 1;
  if (erosionTimer > 2)
  {
    erosionTimer = 0;
  }

  if (erosionTimer == 0 && myImage1.width > 0)
  {
    myImage1.filter(ERODE);
  }


  stroke(#EEF545);
  strokeWeight(10);
  float lx = 75;
  float ly = 250;
  while (lx < 300)
  {
    float nextX = lx + 10;
    float nextY = ly + random(-10, 10);

    if (nextY > 280 + 10)
    {
      nextY = 280;
    }
    else if (nextY < 280 - 10)
    {
      nextY = 280;
    }

    if (nextX > 330)
    {
      nextY = 330;
    }
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
  if (myImage2.width > 0)
  {
    image(myImage2, 215, 130, (width / 2), (height / 1.5));
  }
  if (myImage3.width > 0)
  {
    image(myImage3, -10, 130, (width / 2), (height / 1.5));
  }
}




