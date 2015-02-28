
//Polly L, CP1, 4/5, bouncing ball


ball ABC;
void setup()
{
  ABC = new ball();
  size(300,300);
}
 
void draw()
{
  background(random(0));
  ABC.move();
  ABC.bounce();
  ABC.show();
  
}
 
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(300));
    y=int(random(300));
    up=false;
    right=false;
  }
 
 
  void move()
  {
    if (right == true)
    {
      x+=3;
    }
    else
    {
      x-=3;
    }
    if (up == true)
    {
      y-=20;
    }
    else
    {
      y+=20;
    }
  }
 
  void bounce()
  {
    if (x<25)
    {
      right = true;
    }
    if (x>300)
    {
      right = false;
    }
    if (y<15)
    {
      up = false;
    }
    if (y>275)
    {
      up = true;
    }
  }
 
  void show()
  {
    noStroke();
    fill(random(255));
    ellipse(x, y, 20, 20);
    ellipse(x,x,random(20),20);
    ellipse(y,y,20,20);
    ellipse(y,x,20,20);
  }
}
