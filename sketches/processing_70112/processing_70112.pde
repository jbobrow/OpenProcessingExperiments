
//Laura R., Bubble Animation, CP 1, 14-15

void setup ()
{
  size(500, 500);
  float r = 20;
  float g = 104;
  float b = 245;
  int y = 0;
  while (y < 500)
  {
    stroke(r, g, b);
    line(0, y, 500, y);
    y = y + 1;
    r = r + (20-20)/500.0;
    g = g + (245-104)/500.0;
    b = b + (239-245)/500.0;
  }
}

int  x = 350;
int y1 = 400;
int changeX = 5;
int changeY = 5;

void draw  ()
{
 

  float r = 20;
  float g = 104;
  float b = 245;
  int y = 0;
  while (y < 500)
  {
    stroke(r, g, b);
    line(0, y, 500, y);
    y = y + 1;
    r = r + (20-20)/500.0;
    g = g + (245-104)/500.0;
    b = b + (239-245)/500.0;
  }
  smooth();
  strokeWeight (7);
  stroke (255,100);
  fill (255,2555,255,100);   
  ellipse (x, y1, 50, 50);
  y1 = y1 - changeY;
  if (y1 < 0)
  {
    changeY = -3;
  }
  if (y1 > 500)
  {
    changeY = +5;
  }
  x = x - changeX;
  if (x < 0)
  {
    changeX = -7;
  }
  if (x > 500)
  {
    changeX = +5;
  }
}
