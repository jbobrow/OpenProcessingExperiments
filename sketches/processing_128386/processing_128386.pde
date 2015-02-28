
/* @pjs preload="irongolem.jpg"; */

PImage myimage;
PImage myimage2;

void setup()
{
  size(500, 500);
  
  myimage = requestImage("bonfire.jpg");
  myimage2 = loadImage("irongolem.jpg");
  myimage.filter(GRAY);
  myimage2.filter(BLUR, 2);
}

void draw()
{
  if(myimage.width > 0)
  {
   tint(200,200,0);
  image(myimage2, 0, 0, width, height);
  noTint();
  }
  image(myimage, width/2, height/2, 100, 100);
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(255);
    line(x, 0, x, height);
  }
  
  for (int y = 0; y < height; y += 20)
  {
    stroke(255, 0, 0);
    line(0, y, width, y);
  }
  
  stroke(255);
  strokeWeight(10);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(10);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  
  lx = width/2.5;
  ly = height/2.5;
  for (int n = 0; n < 10; n += 1)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
  }
  strokeWeight(1);
  strokeWeight(1);
  
}


