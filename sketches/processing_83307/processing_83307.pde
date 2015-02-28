
//Amy Chen, Pong, Computer Programming 4/5
Ball hi;
Paddle bob;
void setup()
{
  hi = new Ball();
  bob = new Paddle();
  size(500, 500);
  frameRate(100);
}
void draw()
{
  background(0);
  hi.show();
  bob.show();
  hi.move();
  hi.bounce(); 
  bob.keyPressed();
}
class Ball
{
  int x, y;
  boolean up, right;
  Ball()
  {
    x=int(random(0, 500));
    y=int(random(0, 500));
    boolean up;
    boolean right;
  }
  void show()
  {
    fill(49, 204, 229);
    ellipse(x, y, 30, 30);
  }
  void bounce()
  {
    if (x>485)
    {
      right=false;
    }
    if (x<15)
    {
      right=true;
    }
    if(get(x,y + 16) !=color(0,0,0))
    {
      up=true;
    }
    if (y<15)
    {
      up=false;
    }
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
}
class Paddle
{
  int a;
  Paddle()
  {
    a=250;
  }
  void show()
  {
    fill(255, 255, 255);
    rect(a, 470, 70, 470);
  }
  void keyPressed()
  {
    if (keyPressed ==true && key =='a')
    {
      a--;
    }
    if (keyPressed ==true && key =='d')
    {
      a++;
    }
  }
}



