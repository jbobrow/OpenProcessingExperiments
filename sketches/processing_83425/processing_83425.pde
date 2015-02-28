
//Eric T. Computer Programming 1 Mods 4-5
ball Ball;
pong Paddle;
void setup()
{
  Paddle=new pong();
  Ball=new ball();
  size(320,480);
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
    x=160;
    y=450;
    left=false;
    right=false;
  }
  void keyPressed()
  {
    if(mousePressed == true)
    {
      x=mouseX-20;
    }
  }
  void shows()
  {
    noStroke();
    fill(255);
    rect(x,y,60,20);
  }
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(320));
    y=int(random(480));
    up=false;
    right=false;
  }
  void move()
  {
    if (right == true)
    {
      x+=5;
    }
    else
    {
      x-=5;
    }
    if (up == true)
    {
      y-=5;
    }
    else
    {
      y+=5;
    }
    if(get(x,y+22)==color(255))
    {
      up=true;
    }    
  }
 
  void bounce()
  {
    if (x<20)
    {
      right = true;
    }
    if (x>300)
    {
      right = false;
    }
    if (y<20)
    {
      up = false;
    }
    if (y>460)
    {
      up = true;
    }
  } 
  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 40, 40);
  }
}
