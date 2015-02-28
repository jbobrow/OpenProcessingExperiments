
//Wayland L, Animation, CP1 mods 16-17

int y = 300;
int x = 500;
int change = 10;

void setup()
{
  size(700, 700);
  background(0);
  smooth();
  frameRate(60);
}
void draw()
{ 

  circles();
}

void circles()
{


  ellipse(x, y, x, x);
  x = x + change;

  if ( x > 500)
  {
    fill(32, 54, 188, 10);
    x = 500;
    y = y + change;
  }
  if ( y > 500)
  {
    fill(255, 15, 10, 10);
    y = 500;
    change = -10;
    x = x + change;
  }
  if ( x < 100)
  {
    fill(10, 255, 0, 10);
    x = 200;
    y = y + change;
  }
  if ( y < 100)
  {

    fill(209, 0, 164, 10);
    y = 100;
    change = 10;
    x = x + change;
  }
}
