
PImage cloud9;
PImage vulcun;
PImage tsm;
boolean filterApplied = false;
boolean drawn = false;
void setup()
{
  size(500, 500);
  cloud9 = requestImage("cloud9-2.jpg");
  vulcun = requestImage("vulcun.jpg");
  tsm = requestImage("tsm.jpg");
 }


void draw()
{
  if (cloud9.width > 0)
  {
    image(cloud9, 0, 0, width, height);
    if (filterApplied==false)
    {cloud9.filter(INVERT);
    filterApplied = true;
    }
  }
  float x = 50;
  for (int i = 0; i < 10; i++)
  {
    line(x, 0, x, 500);
    x += 50;
  }
  float y = 50;
  for (int i = 0; i < 10; i++)
  {
    line(0, y, 500, y);
    y += 50;
  }
  if(tsm.width>0)
  {
    image(tsm, 0, 200, width/5, height/5);
  }
  if(vulcun.width>0)
  {
    image(vulcun, 400, 200, width/5, height/5);
  }
    float k = 100;
    float m = 250;
    float prevK = k;
    float prevM = m;
    while (k<390)
    {
      k += 10;
      m += random(-10, 10);
      line(prevK, prevM, k, m);
      prevK = k;
      prevM = m;
    }  
   line(k, m, 400, 250);
  

  
  
  
  
  
}


