
PImage img;
int timer = 0;
int dim;

void setup()
{
  size(275,183);
  dim  = width/2;
  background(255);
  img = loadImage("city.jpg");
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate (30);
}


void draw()
{
  image(img, 0, 0);
  for (int x = 0; x <= width; x+=dim)
  {
    drawGradient(x, height/2);
  }
  timer = timer +1;
  if (timer == 90)
  {
    timer = 0;
  }
  print(timer);
}
  void drawGradient(float x, float y)
  {
    if (timer >= 15 )
    {
    int radius = dim/4;
    float h = random(0, 360);
    float sr = random(0, 275);
    float dr = random(0, 183);
    for (int r = radius; r > 0; --r)
    {
      fill(h, 90, 90);
      rect(sr, dr, r, r);
      h = (h+1) % 360;
     
    }
    }
    if (timer >= 30)
    {
      float s = random(0, 10);
      filter(INVERT);
      scale(s);
    }
  }




