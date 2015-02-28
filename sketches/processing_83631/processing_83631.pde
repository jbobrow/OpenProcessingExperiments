
//Jeffrey C. CP1 4-5 Pong 12/14/12 
ball Ball;
paddle Paddle;
void setup()
{
  Paddle=new paddle();
  Ball=new ball();
  size(400,400);
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
class paddle
{
  int x,y;
  boolean left, right;
  paddle()
  {
    x=100;
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
    fill(200,200,255);
    rect(x,350, 90,20);
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
       
  }
  
  void bounce()
  {
    if (x<10)
    {
      right = true;
    }
    if (x>390)
    {
      right = false;
    }
    if (y<10)
    {
      up = false;
    }
    if (y>390)
    {
      up = true;
    }
    if(get(x,y+12)!=color(0))
    {
      up=true;
    }
  }
  void show()
  {
    noStroke();
    fill(255,200,200);
    ellipse(x, y, 20, 20);
  }
}
