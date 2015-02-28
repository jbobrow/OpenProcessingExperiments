
PImage myImage;
PImage letterA;
PImage letterB;
boolean alreadyPosterize = false;

void setup()
{
  size(500, 500);
  myImage = requestImage("blue.jpg");
  letterA = requestImage("A.jpg");
  letterB = requestImage("B.jpg");
}

void draw()
{
  // Loading Background
  if (myImage.width > 0)
  {
    if (alreadyPosterize == false)
    {
      myImage.filter(POSTERIZE, 10);
      alreadyPosterize = true;
    }
    image(myImage, 0, 0, width, height);
  }
  // Loading letter A
  if (letterA.width > 0)
  {
    image(letterA, 50, 250, 50, 50);
  }
  // Loading letter B
  if (letterA.width > 0)
  {
    image(letterB, 400, 250, 50, 50);
  }
  // Making grid lines
  for (int x = 0; x < 500; x = x + 25)
  {
    line(0, x, 500, x);
    stroke(0, 255, 0);
  }
  for (int y = 0; y <500; y = y + 25)
  {
    line(y, 0, y, 500);
    stroke(0, 255, 0);
  }
  // Making line to connect A picture to B picture
float lx = 00.0;
float ly = 260.0;
  while(lx < width)
  {
   float ax = lx + 1;
   float ay = ly + random(.1);
   line(lx, ly, ax, ay);
   ly = ay;
   lx = ax;
   stroke(255, 0, 0);
   strokeWeight(2);
   }
}



