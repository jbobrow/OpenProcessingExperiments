
//Kitty Kwan, 4-5, Pong

Paddle paddle;
Ball ball;
boolean GameOver=false;

void setup()
{
  background (0);
  size (500, 500);
  paddle= new Paddle ();
  ball= new Ball ();
  
}
void draw ()
{
  background (0);
  fill (0, 0, 0, 10);
  rect (0, 0, 500, 500);
  paddle.show ();

  if (keyPressed==true)
  {
    if (keyCode==RIGHT)
    {
      paddle.moveRight();
    }
    if (keyCode==LEFT)
    {
      paddle.moveLeft ();
    }
  }
  ball.show ();
  ball.bounce ();
  ball.move ();
  if (GameOver)
  {
    fill (255, 0, 0);
    textSize (30);
    text( "Game Over",170,100);
  }
}

class Paddle 
{

  int x;
  Paddle ()
  {
    x= 30 ;
  }

  void moveRight ()
  {
    x=x+5;
  }
  void moveLeft ()
  {
    x=x-5;
  }


  void show ()
  {
    fill (105, 222, 186);
    rect (x, 480, 60, 30);
  }
}

class Ball
{
  int x1;
  int y;
  boolean up;
  boolean right;
  Ball ()
  {
    x1=150;
    y=15;
    boolean up=true;
    boolean right=true;
  }
  void move ()
  {
    if (right==true)
    {
      x1=x1+4;
    }
    else 
    {
      x1=x1-4;
    }
    if (up==true)
    {
      y=y-4;
    }
    else 
    {
      y=y+4;
    }
    if (y>height)
    {
     GameOver=true;
    }
  }
  void bounce ()
  {
    if (y<5)
    {
      up=false;
    }
    if (y>height-30 && y<height && x1>paddle.x && x1<paddle.x+60 )
  
    {
      up=true;
    }
    if (x1>485)
    {
      right=false;
    }
    if (x1<15)
    {
      right=true;
    }
  }
  void show ()
  {
    fill (255);
    ellipse (x1, y, 30, 30);
  }
}
