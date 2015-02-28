
PImage image1;


void setup()
{
  size(360,480);
  image1 = loadImage("andrew.jpg");
  
}
void draw()
{
  
  image(image1, 0, 0, width, height);
  filter(BLUR);
 
  strokeWeight(2);
  for(int x = 0; x < width; x +=10)
  {
    stroke(255,0,255);
    line(x, 0, x,height);
  }
  for(int y = 0; y < height; y +=10)
  {
    stroke(0,0,255);
    line(0, y, width, y);
  }
  stroke(255,0,0);
  strokeWeight(5);
  float ly = 225.0;
  float lx = 145.0;
   
  while (lx < width)
  {
    float nextY = lx + random(10);
    float nextX = ly + random(10);
    line(lx, ly, 151, 225);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
}



