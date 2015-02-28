
// Lucky Wen, Function and Animation, CP1 mods 16-17

int x=20;
int y=20;
int p=20;
int o=20;
int l=20;
int k=20;
int z=30;
int c=30;
int g=10;
int h=10;
int d=10;
int f=10;

void setup()
{ 
  size(500, 420);
  background(#CEA719);
  stroke(0, 255, 0);
  strokeWeight(10);
}


void draw()
{

  ellipse(250, 250, x, y);
  x=x+10;
  y=y+10;
  if (y>300)
  {

    stroke(0);
    strokeWeight(10);
    y=0;
    x=-1;
  }
  {
    frameRate(30);

    ellipse(100, 100, p, o);
    p=p+10;
    o=o+20;
    if (p>100)
    {

      strokeWeight(20);
      stroke(255, 0, 0);
      o=0;
      p=1;
    }
  }
  {
    ellipse(400, 100, l, k);
    l=l+10;
    k=k+20;
    if (l>100)
    {

      k=0;
      l=1;
    }
  }

  {
    triangle(200, 270, 300, 270, 250, 350);
  }

  {
    ellipse(200, 200, g, h);
    g=g+20;
    h=h+20;
    if (g>60)
    {

      g=0;
      h=0;
    }
  }

  {
    ellipse(300, 200, d, f);
    d=d+20;
    f=f+20;
    if (d>60)
    {

      d=0;
      f=0;
    }
  }
}
