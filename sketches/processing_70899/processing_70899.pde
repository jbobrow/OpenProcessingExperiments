
//Derek Kwong Mods 14/15 Computer Programming 1

float x=0;
float y=0;
float xchange=1;
float ychange=1;
float x2=0;
float y2=0;
float xchange2=1;
float ychange2=1;
void setup()
{ noStroke();
  size(500, 500);
  background(0);
}
void draw()
{ 
  triangle(x, y,30,30,40,40);
  x=x+xchange;
  y=y+ychange;
  if (x>500)
  {
    fill(255, 249, 46);
    xchange=-10;
  }
  if (y>499)

  {
    fill(0,0,255);
    ychange=-20;
  }
  if (x<=0)
  {fill(0,255,0);
    xchange=10;
  }
  if (y<=0)
  {fill(255,0,0);
    ychange=10;
  }
}
