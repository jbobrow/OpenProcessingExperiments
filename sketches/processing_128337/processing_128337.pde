
PImage myimage;
PImage myimage2;
PImage myimage3;


void setup()
{
  size(800, 800);
  
  myimage = requestImage("red_shouldered_hawk_sim_1.jpg");
  myimage2 = loadImage("spooderman_original.png");
  myimage3 = loadImage("116.gif");
}

void draw()
{
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
  }
  image(myimage, width, height);
  filter(THRESHOLD); 
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(3);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 10)
  {
    stroke(5);
    line(0, y, width, y);
  
  image(myimage3, width - 200, 0, 200, 200);
    image(myimage2, 0, 0, 200, 200);
  }
    stroke(50);
    strokeWeight(10);
    float ly = 0.0;
    float lx = 0.0;
    while (lx < width)
    {
    float nextY = ly + random(5);
    float nextX = lx + random(25);
    line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
     }
strokeWeight(1);

}




