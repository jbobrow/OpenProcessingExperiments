
// David Avetisyan, 4/5, CP1 (Doubling Shapes)
int x=0;
int y=0;
int z=0;
int q=1;
int w=1;
void setup ()
{
  frameRate(5);
  size (500,500);
}
void draw()
{
  background(x,y,z);
  x=x+10;
  y=y+20;
  z=z+30;
  while(q<=w)
  {
    fill(random(255),random(255),random(255),random(255));
    ellipse(random(500),random(500),5,5);
    q=q+20;
  }
  w=w*2;
}
  void keyPressed()
  {
    if (key=='r')
    {
      w=1;
      q=1;
      x=1;
      y=1;
      z=1;
    }
  }

