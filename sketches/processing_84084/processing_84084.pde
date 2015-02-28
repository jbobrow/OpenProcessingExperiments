
//Priscilla Tai, Bouncing Ball, CP1 Mods 14-15.
//http://www.webs.com/bouncingball.html

/* @pjs globalKeyEvents= "true"; */

Ball bob;
Ball jill;
Paddle pat;

boolean gameOver= false;

void setup()
{
  bob= new Ball();
  jill= new Ball();
  pat= new Paddle();
  size(500, 500);
  frameRate(250);
  text("", 100, 100);
}

void draw()
{
  if (gameOver==false)
  {
    background(0);
    stroke(257, 227, 0);
    line(0, 499, 499, 499);
    pat.move();
    pat.keyPressed();
    pat.showw();
    jill.move();
    jill.bounce();
    jill.show();
    bob.move();
    bob.bounce();
    bob.show();
  }
  if (keyPressed==true && key=='r')
  {
    gameOver=false;
    bob=new Ball();
    jill=new Ball();
  }
}  

class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x= int(random(500));
    y= int(random(400));
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y--;
    }
    else
    {
      y++;
    }
    if (right==true)
    {
      x++;
    }
    else
    {
      x--;
    }
  }
  void bounce()
  {
    if (x<0)
    { 
      right=true;
    }
    if (x>500)
    {
      right=false;
    }
    if (y<0)
    {
      up=false;
    }
    if (y>500)
    {
      up=true;
    }
    if (get(x, y+12)==color(257, 227, 0))
    {
      gameOver=true;
      background(255);
      textSize(24);
      text("press 'r' to restart game", 100, 250);
    }
    if (get(x, y+12)==color(255, 0, 0))
    {
      up=true;
    }
    if (get(x-12, y)==color(0, 255, 0))
    {
      up=false;
    }
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(x, y, 24, 24);
  }
}

class Paddle
{
  int a, b;
  boolean right;
  Paddle()
  {
    a=250;
    b=450;
  }
  void move()
  {
  }
  void keyPressed()
  {
    if (keyPressed==true && key== 'a' && a>0)
    {
      a--;
    }
    if (keyPressed==true && key== 's' && a<420)
    {
      a++;
    }
  }
  void showw()
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(a, b, 80, 10);
  }
}
