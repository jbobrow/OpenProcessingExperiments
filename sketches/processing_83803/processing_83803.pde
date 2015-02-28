
//Andy Ma , CP 1, Mods 14/15

Paddle human;
Ball oon;
int left = 175;
int right = 175;
//Ball bob;
void setup()
{
  size(500,350);
  oon =  new Ball();
  //bob = new Ball();
  human = new Paddle();
}
void draw()
{
  background(0);
  oon.balloon();
  oon.move();
  oon.bounce();
  /*bob.balloon();
  bob.move();
  bob.bounce();*/
  human.keyPressed();
  human.show();
}
class Paddle
{
  void keyPressed()
  {
    if (keyPressed == true && key == 'w')
    {
      left=left-10;
    }
    else if (keyPressed == true && key == 's')
    {
      left=left+10;
    }
    if (keyPressed == true && key == 'i' )
    {
      right=right-10;
    }
    else if (keyPressed == true && key == 'k' )
    {
      right=right+10;
    } 
    }
    void show()
    {
      fill(255);
      rect(5, left, 10, 50);
      rect(485, right, 10, 50);
    }
}
class Ball
{
  int x,y;
  boolean up,right;
  Ball()
  {
    x = int(random(300));
    y = int(random(350)); 
    up = false;
    right = false;
  }
  void balloon()
{
  fill(random(255),random(255),255);
  ellipse (x,y,25,25);
}
  void move()
  {
    if (right == true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
    if (up == true)
    {
      y=y-5;
    }
    else
    {
      y=y+5;
    }
  }
  void bounce()
  {
    if (x<20)
    {
      right = true;
    }
    if (x>480)
    {
      right = false;
    }
    if (y<5)
    {
      up = false;
    }
    if (y>345)
    {
      up = true;
    }
  }
}
