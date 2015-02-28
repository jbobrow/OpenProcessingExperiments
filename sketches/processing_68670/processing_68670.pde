
int _red, _green, _blue;
int y;
boolean redDone, greenDone, blueDone;

void setup()
{
  size(1440, 900);
  redDone = false;
  greenDone = false;
  blueDone = false;
}

void draw()
{
  stroke(_red, _green, _blue);
  line(0, y, width, y);
  
  y++;
  
  if (!redDone)
  {
    _red++;
  }
  else if (!greenDone)
  {
   _green++; 
  }
  else
  {
   _blue++; 
  }
  
  if (y > height)
  {
   y = 0; 
  }
  
  if (_red > 255)
  {
   redDone = true;
  }
  if (_green > 255)
  {
   greenDone = true; 
  }
  if (_blue > 255)
  {
   _red = 0;
   _green = 0;
   _blue = 0;
   redDone = false;
   greenDone = false; 
  }
}

