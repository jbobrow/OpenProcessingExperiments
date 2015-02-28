
/*
   initial parameters
   speed and position
*/
float x = 10; 
float y = 10;

float u = 0;
float v = 0;
float g = 10;

float t = 0.1;

void setup()
{
  size(400,600);
}
void draw()

{
  float dy, dv, dx;
  background(0.5);
  
  dx = u*t;
  dy = v*t;
  dv = g*t;
  
  x = x+dx;  // uypdate 
  y = y+dy;
  v = v+dv;
  
  if (y>500)
  {
    y=500;
    v = -v*0.8;
    u = u + 3;

  }
   ellipse(x,y,10,10);
}


