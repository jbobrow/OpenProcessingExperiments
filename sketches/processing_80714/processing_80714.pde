
boolean isrestarting=true;
int i=0;
int g=0;
int h=0;
ball pong;
paddle playerOne;
paddle playerTwo;
paddle computerOne;
paddle computerTwo;

void setup()
{
  background(0);
  size(400, 400);
}
void draw()
{
  if (isrestarting==true)
  {
    i=int(random(255));
    g=int(random(255));
    h=int(random(255));
    fill(i, g, h);
    textSize(35);
    text("PONG", 156, 132);
    textSize(20);
    text("Press 1 For 2 Players", 111, 165);
    text("Press 2 For Player vs Computer", 65, 195);
    text("Press 3 And Spacebar To... ", 80, 225);
    text("Watch The Madness Unfold", 75, 253);
    text("Press R to Restart", 120, 285);
  }
  if (pong!=null)
  {
    pong.move();
    pong.bounce();
    pong.show();
  }
  if (playerOne!=null)
  {
    playerOne.show();
    playerOne.playerOne();
  }
  if (playerTwo!=null)
  {
    playerTwo.show();
    playerTwo.playerTwo();
  }
  if (computerOne!=null)
  {
    computerOne.show();
    computerOne.computerOne();
  }
  if (computerTwo!=null)
  {
    computerTwo.show();
    computerTwo.computerTwo();
  }
}
class paddle
{
  int r, z, b, c, d;
  paddle()
  {
    r=160;
  }
  void show()
  {
    fill(b, c, d);
    rect(z, r, 10, 60);
  }
  void playerOne()
  {
    c=255;
    z=385;
  }
  void playerTwo()
  {
    b=255;
    z=5;
  }
  void computerOne()
  {
    c=255;
    z=385;
    if (r<pong.y-25)
    {
      r=r+3;
    }
    if (r>pong.y-25)
    {
      r=r-3;
    }
  }
  void computerTwo()
  {
    b=255;
    z=5;
    if (r<pong.y-25)
    {
      r=r+3;
    }
    if (r>pong.y-25)
    {
      r=r-3;
    }
  }
}

class ball
{
  int a, x, y, l, m, n, lm, q;
  boolean right, up, ismoving;
  ball()
  {
    ismoving=true;
    lm=20;
    l=255;
    m=255;
    n=255;
    a=1;
    x=50;
    y=170;
    right=true;
    up=true;
    q=1;
  }

  void move()
  {
    if (ismoving==true)
    {
      if (get( x+10, y) == color(0, 255, 0))
      {
        right=false;
      }
      if (get( x+10, y) == color(0, 254, 0))
      {
        a=0;
        //        println("green loses");
      }

      if (get( x-10, y) == color(255, 0, 0))
      {
        right=true;
      }
      if (get( x-10, y) == color(254, 0, 0))
      {
        a=0;

        //        println("red loses");
      }

      if (up==true & a==1)
      {
        y=y-3;
      }
      if (up==false & a==1)
      {
        y=y+3;
      }
      if (right==true & a==1)

      {
        x=x+3;
      }
      if (right==false & a==1)
      {
        x=x-3;
      }
    }
  }
  void bounce()
  {
    if (ismoving==true)
    {
      if (x<10)
      {
        right=true;
      }
      if (x>390)
      {
        right=false;
      }
      if (y<10)
      {
        up=false;
      }
      if (y>390)
      {
        up=true;
      }
    }
  }
  void show()
  {
    if (ismoving==true)
    {
      noStroke();
      background(0);
      fill(l, m, n);
      ellipse(x, y, lm, lm);
    }
  }
}
void keyPressed()
{

  if (key=='1')
  {
    playerTwo=new paddle();
    playerOne=new paddle();
    pong=new ball();
  }
  if (key=='2')
  {
    playerTwo=new paddle();
    computerOne=new paddle();
    pong=new ball();
  }
  if (key=='3')
  {
    computerOne=new paddle();
    computerTwo=new paddle();
    pong=new ball();
  }

  if (key=='w')
  {
    playerTwo.r= playerTwo.r-20;
  }
  if (key=='s')
  {
    playerTwo.r= playerTwo.r+20;
  }
  if (keyCode == UP)
  {
    playerOne.r=playerOne.r-20;
  }
  if (keyCode == DOWN)
  {

    playerOne.r=playerOne.r+20;
  }
  if (key=='r')
  {
    background(0);
    pong=null;
    playerOne=null;
    playerTwo=null;
    computerOne=null;
    computerTwo=null;
  }
}

