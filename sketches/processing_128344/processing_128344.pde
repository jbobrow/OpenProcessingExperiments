
/* @pjs preload="regigigas.png, mewtwo.png"; */
PImage myimage;
PImage myimage2;


void setup()
{
  size(500,500);
  
  myimage = requestImage("mewtwo.png");
  myimage2 = loadImage("regigigas.png");
}

void draw()
{
  if (myimage.width > 0)
  {
  image(myimage, 0, 0, width, height);
  }
  image(myimage2, width/2, height/2, 150, 150);
  
  filter(POSTERIZE, 2);
  
  for (int x = 0; x < width; x += 5)
  {
    stroke(0);
    line(x, 0, x, height);
  }
  
  for (int y = 0; y< height; y += 10)
  {
    stroke(255,0,0);
    line(0, y, width, y);
  }
  
  stroke(255);
  strokeWeight(10);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  lx = width/2;
  ly = height/2;
  for (int n = 0; n < 10; n += 1)

  strokeWeight(1);
  }



