
float x;
float y;
float a; 
float v;
Float Vindx = 4.666666667;


void setup()
{
  size(displayWidth, displayHeight);
}

void draw()
{
  y = y+v;
  v = a+v;
  a = 0.818/60;
  x = x+Vindx;

  background(255, 255, 255);
  rectMode(CENTER);
  fill(0, 0, 0);
  rect(x, y, 10, 10);

  if (y>700)
  {
    y=0;
    v=0;
  }
}

