
float rot;
float cx, cy;
float offset;
float spin;
void setup()
{
  spin = 0;
  size(800, 800);
  cx = width/2;
  cy = height/2;
  rot = 0;
  noStroke();
  smooth();
  offset = 0;
  rot=PI/2;
}


void draw()
{
  int r = width;
  int i = 0;
  translate(width/2,height/2);
  while (r > 0)
  {
    if (i%2 == 0)
      fill(255,255,255);
    else
      fill(0);
      offset = sin(rot*10)*30;
      rotate(rot);
    rectMode(RADIUS);
    rect(0,0,r,r);
    
    r-=5;
    i++;
  }
  //rot=sin(spin + PI)*PI/3;
  //spin+= PI/5000;
  rot+= PI/10000;
}

