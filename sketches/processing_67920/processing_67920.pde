
void setup()
{
  size(400,400);
}
float r1=0;
int d=0;

void draw()
{
  background(0);
  smooth();
  stroke(255,255,0);
  fill(255,255,0);
  arc(100+d,200, 100,100, QUARTER_PI-r1,PI+HALF_PI+QUARTER_PI+r1);
  stroke(0);
  fill(0);
  arc(80+d,180, 30,30, QUARTER_PI-r1,PI+HALF_PI+QUARTER_PI+r1);
  if(QUARTER_PI-r1<=0)
  r1=0;
  if(d>=400)
  d=-100;
  r1=r1+0.05;
  d=d+5;
  
}
