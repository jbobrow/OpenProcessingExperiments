
//bouncing ball project for computer programming 1
//Iam B

Ball bob[];
void setup()
{
  size(500,500);
  bob=new Ball[50];
  for(int i=0;i<50;i++)
  {
    bob[i]=new Ball();
  }
}
void draw()
{
  background(0);
  for(int i=0;i<50;i++)
  {
   bob[i].travel();
   bob[i].bounce();
   bob[i].show(); 
  }
}
class Ball
{
  int x,y;
  boolean up,right;
  int g,b;
  int d;
  Ball()
  {
    x=int(random(500));
    y=int(random(500));
    up=false;
    right=true;
    g=int(random(170));
    b=int(random(255));
    d=int(random(40,100));
  }
  void travel()
  {
    if (right==true)
    {
      x=x+3;
    }
    else
    {
      x=x-3;
    }
    if (up==true)
    {
      y=y-3;
    }
    else
    {
      y=y+3;
    }
  }
   void bounce()
  {
    if(x>499)
    {
      right=false;
    }
    else if(x<1)
    {
      right =true;
    }
    if(y>499)
    {
      up=true;
    }
    else if(y<1)
    {
      up=false;
    }
  }
  void show()
  {
    fill(150,g,b);
    stroke(b,g,150);
    strokeWeight(2);
    ellipse(x,y,d,d);
  }
}


