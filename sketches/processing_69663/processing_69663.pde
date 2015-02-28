
/*
 * @Author Mario Boot
 * Computational Design
 */

ical CAL;
timevis VIS;

void setup()
{
  size(800, 600);

  CAL = new ical();
  VIS = new timevis();
}

void draw()
{

  smooth();  

  VIS.draw();
  CAL.draw();
}


