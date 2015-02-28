

int amplitude;
int wavenumber;
int offset;
int timevalue;

void setup()
{
  size(400,400);
  background(0);
  amplitude = 100;
  wavenumber = 10;
  offset = 200;
  timevalue = 0;
  strokeWeight(3);
}


void draw()
{
  if (timevalue >= 400)
  {
    background(0);
    timevalue = 0;
    amplitude = (int) random(200);
    wavenumber = (int) random(15);
    offset = (int) random(400.0/wavenumber);
  }
  timevalue = (timevalue + 1);
  stroke(random(150), random(150), 255);
  point(timevalue, 200-amplitude*sin(radians(timevalue*wavenumber + offset)));
  
  
}

