
//Benson L, Functions and Animation, CPI mods 14-15
int x2 = 1;
int y2 = 50;
int z = 5;
int a = 390;
int b = 50;
int c = 5;
int d = 1;
int e = 20;
int f = 5;
int g = 1;
void setup()
{
  size(400,400);
}
void draw()
{
  background(0);
  fill(255,0,0);
  frameRate(8);
  ellipse(x2,200,y2,y2);
  x2 = x2 + z;
  if(x2 > 390)
  {
    frameRate(50);
    fill(0,0,0,240);
    ellipse(390,200,y2 - 20, y2 - 20);
    y2 = y2 + 1;
    z = 0;
  }
  if (x2 > 390)
  {
    fill(255,0,0);
    ellipse(a,200,b,b);
    a = a - c;
  }
  if(a < 1)
  {
    fill(0,0,0,240);
    ellipse(1,200,b - 20, b - 20);
    c = 0;
    b = b + d;
  }
  if(b > 600)
  {
    frameRate(15);
    fill(41,d,13);
    ellipse(200,200,e,e);
    e = e + f;
    d = d + 10;
  }
  if(d > 200)
  {
    fill(0);
    ellipse(200,200,g,g);
    g = g + f;
  }
}
