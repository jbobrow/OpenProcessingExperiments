
int x = 5;
int y = 1;
int q = 20;
int w = 20;
int e = 10;
int r = 10;
int p = 10;
int o = 10;
int i = 10;
int u = 10;
void setup()
{
  print("x");
  size (500, 500);
  frameRate(30);
  background(255, 255, 255);
}
void draw()
{
}

void keyPressed()
{
  if (key == 't')
  {
    
    fill(155, mouseX, mouseY, 50);
    triangle(mouseX, mouseY, q, q, w, 200);
    triangle(500-mouseX, 500-mouseY,q,q,w,200);

    q=q+e;
    w=w+r;
    if (q>501)
    {
      e=-10;
    }
    if (q<1)
    {
      e=10;
    }
    if (w>501)
    {
      r=-10;
    }
    if (w<1)
    {
      r=10;
    }
  }
  if (key == 'l')
  {
    line(mouseX, mouseY, p, o);
    p = p+i;
    o = o+u;

    if (p>501)
    {
      i=-10;
    }
    if (p<10)
    {
      i=10;
    }
    if (o>501)
    {
      u=-10;
    }
    if (o<10)
    {
      u=10;
    }
  }
  if (key == 'e')
  {
    background(255, 255, 255);
  }
}
