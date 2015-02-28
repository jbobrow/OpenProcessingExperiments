
Ball rawr;
void setup()
{
  rawr=new Ball();
  size(200,200);
}
void draw()
{
  background(255);
  rawr.boing();
  rawr.raa();
  rawr.tadaa();
}
class Ball
{
  int x;
  float y;
  boolean upp;
  boolean rightt;
  Ball()
  {
    x=int(random(0,200));
    y=int(random(0,200));
    upp = true;
    rightt = true;
  }
  void tadaa()
  {
    noStroke();
    fill(0,110,255);
    ellipse(x,y,20,20);
  }
  void raa()
  {
    if(rightt==true)
    {
      x++;
    }
    else
    {
      x--;
    }
    if(upp==true)
    {
      y=y/1.08;
    }
    else
    {
      y=y*1.08;
    }
  }
  void boing ()
  {
    if(y>200)
    {
      upp=true;
    }
    if(y<1)
    {
      upp=false;
    }
    if(x<1)
    {
      rightt=true;
    }
    if(x>200)
    {
      rightt=false;
    }
  }
}
