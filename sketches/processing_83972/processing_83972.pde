
//Jun Min Zhong, Mods 16-17, CP1, Pong

Ball jarvis;
Paddle rjustin;
boolean GG=false;
void setup()
{
  jarvis=new Ball();
  rjustin=new Paddle();
  size(1000, 1000);
  frameRate(60);
}

void draw()
{
  if (GG==true)
  {
    fill(255,200);
    textSize(200);
    text("HAHA!!", 150, 400);
  }

  else
  {
    background(0);
    rjustin.show();
    rjustin.move();
    jarvis.move();
    jarvis.bounce();
    jarvis.show();
  }
}


class Paddle
{
  int a;
  boolean right;
  Paddle()
  {
    a=int(random(1000));
    right=true;
  }

  void move()
  {
    if (right==true)
    {
      a=a+5;
    }
    if (right==false)
    {
      a=a-5;
    }
    if (keyPressed == true && key == 'a')
    {
      right=false;
    }
    if (keyPressed == true && key == 'd')
    {
      right=true;
    }
    if (a<0)
    {
      right=true;
    }
    if (a>985)
    {
      right=false;
    }
  }

  void show()
  {
    fill(100,0,0);
    rect(a, 900, 15, 100);
  }
}




class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(1000));
    y=int(random(1000));
    up=true;
    right=true;
  }

  void move()
  {
    if (up==true)
    {
      y=y-5;
    }
    if (up==false)
    {
      y=y+5;
    }
    if (right==true)
    {
      x=x+5;
    }
    if (right==false)
    {
      x=x-5;
    }
  }

  void bounce()
  {
    if(get(x,y+100)==color(100,0,0))
    {
      up=true;
    }
    
    
    if (x>900)
    {
      right=false;
    }
    if (x<50)
    {
      right=true;
    }
    if (y<50)
    {
      up=false;
    }
    if (y>950)
    {
      GG=true;
    }
  }
  void show()
  {
    fill(255,255,255);
    ellipse(x, y, 100, 100);
  }
}
