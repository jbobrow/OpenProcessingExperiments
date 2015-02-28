
ball Ball;
pong Paddle;
void setup()
{
  Paddle=new pong();
  Ball=new ball();
  size(500,500);
}
  
void draw()
{
  background(0);
  Paddle.keyPressed();
  Paddle.shows();
  Ball.move();
  Ball.bounce();
  Ball.show();
}
class pong
{
  int x,y;
  boolean left, right;
  pong()
  {
    x=140;
    y=480;
    left=false;
    right=false;
  }
  void keyPressed()
  {
    if(keyPressed == true & key=='d')
    {
      x+=2;
    }
    if(keyPressed==true & key=='a')
    {
      x-=2;
    }
  }
  void shows()
  {
    noStroke();
    fill(255);
    rect(x,y,40,10);
  }
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
      x+=2;
    }
    else
    {
      x-=2;
    }
    if (up == true)
    {
      y-=2;
    }
    else
    {
      y+=2;
    }
    if(get(x,y+12)==color(255))
    {
      up=true;
    }   
  }
  
  void bounce()
  {
    if (x<1)
    {
      right = true;
    }
    if (x>499)
    {
      right = false;
    }
    if (y<1)
    {
      up = false;
    }
    if (y>499)
    {
      text("GAME OVER",230,250);
    }
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
