
//Polly L, CP1, 4/5, PONG

Paddle abc;
ball ABC;
void setup()
{
  ABC = new ball();
  abc = new Paddle();
  size(300, 300);
}

void draw()
{
  background(random(0));
  abc.movee();
  abc.showw();
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
      x+=1;
    }
    else
    {
      x-=1;
    }
    if (up == true)
    {
      y-=1;
    }
    else
    {
      y+=1;
    }
  }

  void bounce()
  {
    if (x<0)
    {
      right = true;
    }
    if (x>300)
    {
      right = false;
    }
    if (y<0)
    {
      up = false;
    }
    if (y>300)
    {
      up = true;
    }
    if (get(x-11,y) == color(255))
    {
      right = true;
    }
  }

  void show()
  {
    noStroke();
    fill(255);
    ellipse(x, y, 20, 20);
  }
}
class Paddle
{
  int a, b;
  boolean up, right;
  Paddle()
  {
    a=0;
    b=300;
    up=false;
    right=true;
  }
  void movee()
  {
    if (keyPressed==true && key=='i')
    {
      a=a-3;
    }
    if (keyPressed==true && key=='m')
    {
      a=a+3;
    }
  }

  void showw()
  {
    rect(0, a, 10, 80);
  }
}
