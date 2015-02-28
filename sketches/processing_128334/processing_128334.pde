
/* @pjs preload="Aurora.jpg"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(750, 500);
  myimage = requestImage("Aurora.jpg");
  myimage2 = requestImage("Tyrantrum.png");
  myimage3 = requestImage("Tyrantrum2.png");
}

void draw()
{
  image(myimage, 0, 0, width, height);
  myimage.filter(GRAY);
  
  strokeWeight(1);
  for (int x = 0; x < width; x += 25)
  {
    stroke(255);
    line(x, 0, x, height);
  }
  
  for (int y = 0; y < height; y += 25)
  {
    stroke(0, 0, 255);
    line(0, y, width, y);
  }
  
  stroke(#FF8103);
  strokeWeight(5);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(1, 50);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  
  
  image(myimage2, 0, 200, 250, 300);
  image(myimage3, 500, 200, 250, 300);
}


