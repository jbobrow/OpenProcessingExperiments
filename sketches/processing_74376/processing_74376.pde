
//Cole Pierce, CP1, mods 4-5
int x=0;
int y=0;
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int k=0;
int j=0;
int l=0;
int m=0;
void setup()
{
  size(500, 500);
}
void draw()
{
  x=50;
  y=50;
  frameRate(15);

  while (x<51)
    
  {
    noStroke();
    if (d==1)
    {
      e=int(random(255));
      f=int(random(255));
      g=int(random(255));
      background(e, f, g);
    }
    if (d==2)
    {

      background(e, f, g);
    }
    fill(j, k, l, m);
    ellipse(x+a, y+b, 50+c, 50+c);
    x=x+a;
    a=int(random(400));
    b=int(random(400));
    c=int(random(400));
    j=int(random(255));
    k=int(random(255));
    l=int(random(255));
    m=int(random(255));
  }
}
void mouseClicked()
{

  d=1;
}
void keyPressed()
{
  d=2;
  e=int(random(255));
  f=int(random(255));
  g=int(random(255));
}
