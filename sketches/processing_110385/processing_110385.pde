
float x = 0;
float speed = 10;
int colorTimer = 0;
color circleColor;
PImage myImage;
PImage gtaImage;
PImage samusImage;

void setup()
{
  size(570, 300);
  frameRate(30);
  
  myImage = requestImage("ravine.jpg");
   gtaImage = requestImage("gta-v.png");
    samusImage = requestImage("Samus.png");
  
}

void draw()
{
  if (myImage.width > 0)
  {
    myImage.filter(GRAY);
    image(myImage, 0, 0, width, height);
  }
  
  if (gtaImage.width > 0)
  {
    image(gtaImage, 400, 110, 100, 100);
  }
  
  if (samusImage.width > 0)
  {
    image(samusImage, 0, 50, 300, 300);
  }
  
  stroke(247);
  strokeWeight(15);
  float ly = 140;
  for (float lx = 0; lx < width;)
  {
    float nextY = ly + random (-10, 10);
    float nextX = lx + 10;
    line(lx, ly, nextX, nextY);
    lx = nextX;
    ly = nextY;
  }
  strokeWeight(1);
  
  for (int x = 0; x < width; x += 30)
  {
    line(x, 0, x, height);
  }
  
 for (int y = 0; y < height; y += 30)
  {
    line(width, y, 0, y);
  }
  
}


