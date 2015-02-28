
int   nbrPoints = 150;
int   cx,cy;
float crad;
float cycleLength = 2*PI*nbrPoints; // 628 seconds
int   counter =0 ;
float   speed = 1;
int   frameCtr = 0;

void setup()
{
  size(500, 500);
  cx = width/2;
  cy = height/2;
  crad = (min(width,height)/2) * 0.95;
  noStroke();
  smooth();
  colorMode(HSB, 1);
  background(0);
  
  cycleLength = 60*30;
  speed = (1*PI*nbrPoints) / cycleLength;
}

void draw()
{
  int trail = 1;
  background(0);
  fill(0,0,.5);

  nbrPoints = 150;
  float mx = mouseX/(float)width;
  float my = mouseY/(float)height;
  speed = (1*PI*nbrPoints) / cycleLength;

  float timer = millis()*.001*speed;
  
  counter = int(timer / cycleLength);

  for (int j = 0; j < trail; ++j)
  {
    for (int i = 0; i < nbrPoints; ++i)
    {
  
      float r = i/(float)nbrPoints;
      if ((counter & 1) != 0)
        r = 1-r;

      float a = timer * r;
      float len = i*crad/(float)nbrPoints;
      
      len *= sin(a*timer*my*.25);
      int x = (int) (cx + cos(a)*len);
      int y = (int) (cy + sin(a)*len);
      float hue = r+timer*.01; //  + mouseY/(float)height;
      hue -= int(hue);
      fill(color(hue,.5,1-j/(float)trail));
      ellipse(x,y,8,8);
    }
    timer -= speed;
  }
  frameCtr++;
}

