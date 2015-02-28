
Ball rawr;
Paddle hey;
void setup()
{
  rawr=new Ball();
  hey=new Paddle();
  size(200,200);
}
void draw()
{
  background(255);
  rawr.boing();
  rawr.whee();
  rawr.raa();
  rawr.tadaa();
  hey.you();
  hey.there();
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
      y--;
    }
    else
    {
      y++;
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
    if(get(x,y+12) != color(255))
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
    rect(la-20,height-10,40,10);
  }
  void you()
  {
    if(mouseX>la) 
    {
      la=la+3;
    }
    if(mouseX<la)
    {
      la=la-3;
    }
  }
}
