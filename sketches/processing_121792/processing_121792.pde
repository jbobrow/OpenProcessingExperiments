
PImage fire;


void setup()
{
  size(500,500);
  fire = requestImage("fire.jpg");
  background(0);
  frameRate(15);
}
 
 
void draw ()
{
   if (fire.width >0)
  {
    fire.filter(INVERT);
    image(fire,0,0,width,height);
  }

  
  strokeWeight(10);
  float ly = 0;
  float lx = 0;
 
  while (lx < 500)
  {
    float nextx = lx + random(50);
    float nexty=  ly + random(50);
    fill(255,50,95);
    line(lx, ly, nextx, nexty);
    lx = nextx;
    ly = nexty;
  }
  strokeWeight(10);
  float ay = 500;
  float ax = 0;
   
 
  while (ax < 500)
  {
    float nextx = ax + random(25);
    float nexty=  ay + random(25);
    fill(255,255,0);
    line(ax, ay, nextx, nexty);
    ax = nextx;
    ay = nexty;
  }
    strokeWeight(1);
  for (int i = 0; i < width; i = i + 1)
  {
    float percent = i / (float)width;
    stroke(i,(random(2)),random(255));
    line(250,0,i,height);
  }


   
   
}



