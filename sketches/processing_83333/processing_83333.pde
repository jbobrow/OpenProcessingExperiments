
ball F = new ball();
paddle C = new paddle();
void setup()
{
  size(600, 600); 
  frameRate(100);
}
void draw() 
{
  background(0);
  C.show();
  C.move();
  F.show();
  F.bounce();
  F.move();
  
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=100;
    y=300;
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    if (up==false)
    {
      y++;
    }
    if (right==true)
    {
      x++;
    }
    if (right==false)
    {
      x--;
    }
  }
  void bounce()
  {
    if (y>=600)
    {
      up =true;
    }
    if (y<=27)
    {
      up=false;
    }
    if (x<=0)
    {
      right=true;
    }
    if (x>=600)
    {
      right=false;
    }
  }
  void show()
  {
    noStroke();
    smooth();
    fill(250, 0, 0);
    ellipse(x, y, 60, 60);
  }
}
class paddle
{
  int x2, y2;
  paddle()
  {
    x2= 250;
    y2= 500;
  }
  void move()
  {
    if (keyPressed == true && key == 'a')
    {
      x2= x2--;
    }
    if (keyPressed ==true && key =='d')
    {
      y2= y2--;
    }     
  }
  void show()
  {
    rect(x2, y2, 100, 40);
  }
}
