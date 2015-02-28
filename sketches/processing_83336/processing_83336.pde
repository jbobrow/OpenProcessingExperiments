
Paddle Pong;
Ball Scott;
void setup()
{
  size(600, 600);
  Pong= new Paddle();
  Scott = new Ball();
}
void draw()
{
  background(0);
  Pong.keyPressed();
  Pong.show1();
  Scott.move();
  Scott.bounce();
  Scott.show();
}
class Paddle
{
  int x1, w;
  boolean right;
  Paddle()
  {
    x1=300;
    w=0;
  }
  void keyPressed()
  {
    if (keyPressed==true & key=='q')
    {
      x1=x1-5;
    }
    if (keyPressed==true & key=='e')
    {
      x1=x1+5;
    }
    if (keyPressed==true & key== 'w')
    {
      w=w-1;
    }
    if (keyPressed==true & key== 'b')
    {
      w=w+1;
    }
  }
  void show1()
  {
    fill(255, 0, 0);
    rect(x1, 500, 100, 25+w);
  }
}
class Ball
{
  int x, y, d, c;
  boolean up, right;
  Ball()
  {
    d=0;
    c=0;
    x=int (random (0, 600));
    y=int (random (0, 600));
    up=true;
    right=true;
  }
  void move()
  {
    if (up==true)
    {
      y=y+5;
    }
    else
    {
      y=y-5;
    }
    if (right==true)
    {
      x=x+5;
    }
    else
    {
      x=x-5;
    }
  }
  void bounce()
  {
    if (x>575)
    {
      right=false;
    }
    if (x<25)
    {
      right= true;
    }
    if (y>575)
    {
      up= false;
    }
    if (y<25)
    {
      up= true;
    }
    if (get(x+19, y+19) != color(0))
    {
      up=!up;
      d= int(random(0, 256));
      c= int(random(0, 256));
    }
  }
  void show()
  {
    fill(d, 150, c);
    ellipse(x, y, 50, 50);
  }
}



