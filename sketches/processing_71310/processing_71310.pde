
//Wayland L, Animation, CP1 mods 16-17
int x = 250;
int y = 250;
int change = 1;
void setup()
{
  size(500, 500);
  background(20);
  frameRate(20);
}
void draw()
{
  noStroke();
  fill(0, 0, 0, 15);
  rect(0, 0, width, height);
  fill(random(256), random(256), random(256));
  ellipse(x, y, 20, 20);
  if (key == 'w')
  {
    change = -10;
    y = y + change;
  }
  if (key == 's')
  {
    change = 10;
    y = y + change;
  }
  if (key ==  'd')
  {
    change = 10;
    x = x + change;
  }
  if (key ==  'a')
  {
    change = -10;
    x = x + change;
  }
  if ( x < 0)
  { 
    x = 500;
  }
  if ( x > 500)
  { 
    x = 0;
  }
  if ( y < 0)
  { 
    y = 500;
  }
  if ( y > 500)
  { 
    y = 0;
  }
}
