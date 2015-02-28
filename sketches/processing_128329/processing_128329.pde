
PImage myimage;
PImage myimage2;
PImage myimage3;
void setup()
{
  size(500, 667);
  
  myimage = requestImage("ZACH.JPG");
  myimage2 = loadImage("skateboarding.jpg");
  myimage3 = loadImage("CAT.jpg");
  
}
void draw()
{
  if (myimage.width > 0)
  {
   image(myimage, 0, 0, width, height);
  }
  filter(BLUR);
  image(myimage2, 300, 50, 100, 100);
  image(myimage3, 45, 50, 100, 100);
  for(int x = 0; x < width; x +=10)
  {
    stroke(255);
    line(x, 0, x,height);
  }
  for(int y = 0; y < height; y +=10)
  {
    stroke(0,255,0);
    line(0, y, width, y);
  }
  
  
  stroke(255);
  strokeWeight(10);
  float ly = 100.0;
  float lx = 145.0;
  
  while (lx < width)
  {
    float nextY = lx + random(10);
    float nextX = ly + random(50);
    line(lx, ly, 300, 100);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
  
}


