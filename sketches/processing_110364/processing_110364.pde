
PImage Back;
PImage frontone;
PImage fronttwo;

void setup()
{
  size(800,500);
  Back = requestImage("Back.jpg");
  frontone = requestImage("frontone.jpg");
  fronttwo = requestImage("fronttwo.jpg");
  frameRate(30);
}


void draw ()
{
  if (Back.width > 0)
  {
    Back.filter(THRESHOLD);
    image(Back, 0, 0, width, height);
    image(frontone, 0, 0, 100, 100);
    image(fronttwo, 700, 400, 100, 100);
  }
   int xx = 0;
   int yy = 0; 
   strokeWeight(2);
  while (xx < width)
  {
    stroke(#CC3300);
    line(xx, 0, xx, height);
    xx += 50;
  }
  while (yy < height)
  {
    stroke(#CC6600);
    line(0, yy, width, yy);
    yy += 50;
  }
  
  
  stroke(#000000);
  strokeWeight(5);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextx = lx + random(15);
    float nexty=  ly + random(10);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  
   ly = 0.0;
   lx = 0.0;
  while (lx < width)
  {
    float nextx = lx + random(50);
    float nexty=  ly + random(50);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  strokeWeight(1);
  
  
}


