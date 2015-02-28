
Ball rawr;
Paddle hey;
void setup()
{
  rawr=new Ball();
  hey=new Paddle();
}
void draw()
{
  background(255);
  hey.you();
  hey.there();
  rawr.boing();
  rawr.whee();
  rawr.raa();
  rawr.tadaa();
}
class Ball
{
  int x;
  int y;
  boolean upp;
  boolean rightt;
  Ball()
  {
    x=int(random(0,width));
    y=int(random(0,height));
    upp = true;
    rightt = true;
  }
  void tadaa()
  {
    noStroke();
    fill(0,110,255);
    ellipse(x,y,40,40);
  }
  void raa()
  {
    if(rightt==true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
    if(upp==true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
  }
  void boing ()
  {
    if(y>height)
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
    if(x>width)
    {
      rightt=false;
    }
  }
  void whee()
  {
    if(get(x,y+21) == color(0,110,255))
    {
      upp=true;
    }
  }
}
class Paddle 
{
  int la; 
  Paddle()
  {
    la=width/2;
  }
  void there()
  {
    noStroke();
    fill(0,110,255);
    rect(la-80,height-40,160,40);
  }
  void you()
  {
    if(mouseX>la) 
    {
      la=la+5;
    }
    if(mouseX<la)
    {
      la=la-5;
    }
  }
}
