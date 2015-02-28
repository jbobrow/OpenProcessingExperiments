
// Abby Zhang CP1 4,5


ball Ball;
paddle Bill;

void setup()
{
  Ball = new ball();
  Bill = new paddle();
  size(300,300);
}
 
void draw()
{
  background(0);
  Ball.show();
  Bill.show();
  Ball.move();
  Ball.bounce();
  Bill.keyPressed();
}
class ball
{
  int x, y;
  boolean up, right;
  ball()
  {
    x=int(random(0, 500));
    y=int(random(0, 500));
    boolean up;
    boolean right;
  }
  void show()
  {
    fill(100, 100, 229);
    ellipse(x, y, 25, 25);
  }
  void bounce()
  {
    if (x>287)
    {
      right=false;
    }
    if (x<13)
    {
      right=true;
    }
    if(get(x,y + 13) !=color(0,0,0))
    {
      up=true;
    }
    if (y<13)
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
 
class paddle
{
  int a;
  paddle()
  {
    a=250;
  }
  void show()
  {
    fill(0,255,255);
    rect(a,280,50,270);
  }
  void keyPressed()
  {
    if( keyPressed == true && key=='a')
    {
      a--;
    }
    if( keyPressed ==true && key=='d')
    {

      a++;

    }
  }
}
